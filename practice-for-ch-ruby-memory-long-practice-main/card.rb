class Card
    attr_reader :val, :face

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
        self.val == card.val
    end

    def to_s
        self.to_s
    end
end