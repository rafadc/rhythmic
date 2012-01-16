require "rythmic"

drums = Drumkit.new "gmkit"
drums.pattern("kick", 0, 1) 
drums.pattern("tom_hi", 2)
drums.play 4
