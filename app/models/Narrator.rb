class Narrator
    def new_turn(name)
        return <<-TEXT

* '#{name}' - new turn:
=================================
        TEXT
    end

    def generic_roll(name)
        return "'#{name}' rolls...\n"
    end

    def end_game
        return <<-TEXT

---------------
| END OF GAME |
---------------

 Results
=========
        TEXT
    end

    def leaderboard_entry(name, score)
        return "'#{name}' - #{score}\n"
    end

    def winner_announcement(name, score, tied)
        if !tied
            return <<-TEXT

The winner is...
#{name}, with a score of #{score}!
            TEXT
        else
            return <<-TEXT

It's a tie!
#{name} have tied, with a score of #{score}!
            TEXT
        end
    end

    def drop_dead_dice(player, dead_dice, points, dice_string)
        name = player.get_name
        output = dice_string
        if dead_dice > 0
            output += <<-TEXT

Oh no! '#{name}' gets #{dead_dice} of their remaining dice removed!
            TEXT
            if player.remove_dice(dead_dice)
                output += "--> They now have #{player.get_num_dice} left.\n"
            else
                output += <<-TEXT

----------
DROP DEAD!
'#{name}' has no dice left! They are eliminated!
--> They have a final score of #{player.get_points}!
                TEXT
                player.eliminate
            end
        else
            output += <<-TEXT

Nice roll! '#{name}' earns #{points} points!
--> They now have a score of #{player.get_points}!
            TEXT
        end
        return output
    end

    def invalid_game
        return <<-TEXT

=============================
|| INVALID GAME PARAMETERS ||
=============================
This version of the Drop-Dead Dice Game must be played with at least 2 dice (with at least 6 sides), and at least 1 player.
The game must be run with parameters that meet these conditions, or else the game will not start.
        TEXT
    end

end