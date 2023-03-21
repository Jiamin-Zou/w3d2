class Card
    attr_reader :value, :face

    def initialize (val)
        @value = val
        @face = false
    end

    def hide
        @face = false
    end

    def reveal
        @face = true
    end

    def == (card)
        self.value == card.value
    end

    def to_s
        self.to_s
    end
end