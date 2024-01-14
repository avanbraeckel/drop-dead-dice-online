class GamesController < ApplicationController
  def index
  end

  def getoptions
    respond_to do |format|
      play_game()
      format.html { render :playgame }
    end
  end

  def play_game    
    @player_count = params[:num_players].to_i
    @dice_count = params[:num_dice].to_i
    @sides = params[:num_sides].to_i

    @narrator = Narrator.new
    @game_text = "\n"

    # Error-check the parameters
    if @dice_count < 2 || @sides < 6 || @player_count < 1
      # invalid game
      @game_text += @narrator.invalid_game
      return
    end

    # create the players
    player_array = load_players(@player_count, @dice_count, @sides)

    # Primary game loop
    while !@is_finished do
      @is_finished = true
      for p in player_array do
        if !p.is_eliminated
          @is_finished = false
          while p.is_playing do
            @game_text += @narrator.new_turn(p.get_name)
            points = 1
            while points > 0 do
              @game_text += @narrator.generic_roll(p.get_name)
              roll_info = p.roll_dice
              points = roll_info["points"]
              @game_text += @narrator.drop_dead_dice(p, roll_info["dead"], points, roll_info["dice"]);
            end
          end
        end
        p.set_playing(true) # Set back to default before starting next player's turn
      end
    end

    # Calculate results
    finish_game(player_array)
  end

  private def finish_game(players)
    @game_text += @narrator.end_game
    highest_score = -1
    winner_name = ""
    is_a_tie = false
    for p in players do
      @game_text += @narrator.leaderboard_entry(p.get_name, p.get_points)
      if p.get_points > highest_score
        is_a_tie =  false
        winner_name = "'#{p.get_name}'"
        highest_score = p.get_points
      elsif p.get_points == highest_score # Tied
        is_a_tie = true
        winner_name = "#{winner_name} & '#{p.get_name}'"
      end
    end
    # Display results
    @game_text += @narrator.winner_announcement(winner_name, highest_score, is_a_tie)
  end

  private def load_players(num_players, num_dice, num_sides)
    arr = []
    for i in 1..num_players do
      arr.push(Player.new("Player #{i}", num_dice, num_sides))
    end
    return arr
  end
end