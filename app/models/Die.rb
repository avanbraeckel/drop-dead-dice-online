class Die
    def initialize(sides)
        @num_sides = sides
        @face_up_value = 1
    end

    def roll
        @face_up_value = rand(@num_sides) + 1
        return @face_up_value
    end

    def get_value
        return @face_up_value
    end
end