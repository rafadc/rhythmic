require "./rhythmic"

drums = Rhythmic::Drumkit.new "gmkit"
drums.pattern("kick", 0, 0, 1)
drums.pattern("tom_hi", 0, 2)
drums.play

