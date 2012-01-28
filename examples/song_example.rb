require "./rhythmic"

drums = Rhythmic::Drumkit.new "gmkit"
drums.pattern("kick", 1, [0, 1, 3, 5, 6])
drums.pattern("tom_hi", 1, [0, 2])
drums.play

