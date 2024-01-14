
class Player
    def initialize(name, num_dice, num_sides)
        # Class variable for the helper class that provides player action functionality - no unique instances needed
        @@PLAYER_ACTION_HELPER = PlayerActionHelper.new
        @player_name = name
        @playing = true
        @eliminated = false
        @total_points = 0
        @dice_array = @@PLAYER_ACTION_HELPER.load_dice(num_dice, num_sides)
    end

    def roll_dice
        info_hash = @@PLAYER_ACTION_HELPER.simulate_dice_roll(@dice_array)
        # Update player status/score
        @playing = info_hash["playing"]
        @total_points += info_hash["points"]
        return info_hash
    end

    def get_points
        return @total_points
    end

    def get_name
        return @player_name
    end

    def is_playing
        return @playing
    end

    def set_playing(playing)
        @playing = playing
    end

    def is_eliminated
        return @eliminated
    end

    def eliminate
        @eliminated = true
    end

    def remove_dice(num)
        for i in 1..num do
            @dice_array.pop
        end
        if @dice_array.length <= 0
            return false
        else
            return true
        end
    end

    def get_num_dice
        return @dice_array.length
    end
end