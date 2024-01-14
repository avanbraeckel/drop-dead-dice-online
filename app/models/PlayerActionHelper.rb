class PlayerActionHelper
    def load_dice(num_dice, num_sides)
        arr = []
        for i in 1..num_dice do
            arr.push(Die.new(num_sides))
        end
        return arr
    end

    def simulate_dice_roll(dice_array)
        dice_string = ""
        count = 0
        for d in dice_array do
            count = count + 1
            value = d.roll
            if value == 2 || value == 5
                dice_string = dice_string + "===x #{value}"
            else
                dice_string = dice_string + "===> #{value}"
            end

            if count < dice_array.length
                dice_string = dice_string + "\n"
            end
        end

        return calculate_points(dice_array).merge({"dice" => dice_string})
    end

    private def calculate_points(dice_array)
        points = 0
        dead_dice = 0
        playing = true
        for d in dice_array do
            if d.get_value == 2 || d.get_value == 5
                dead_dice = dead_dice + 1;
            end
            points += d.get_value
        end

        if dead_dice > 0
            playing = false
            points = 0
        end

        output_hash = {"points" => points, "dead" => dead_dice, "playing" => playing}
        return output_hash
    end
end