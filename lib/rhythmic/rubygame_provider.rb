module Rhythmic
  class RubygameProvider

    def load(filename)
      Rubygame::Sound.load(filename)
    end
  end
end