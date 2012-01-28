module Rhythmic
  class Song

    def initialize
      @playables = []
    end

    def add(playable)
      @playables.push playable
    end

    def play
      @playables.each {|playable| playable.play}

    end
  end
end