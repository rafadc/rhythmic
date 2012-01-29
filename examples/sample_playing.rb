require "./rhythmic"

heart = Rhythmic::Sample.new("YourInOrYourOut.wav")
heart.play_after(0,3,3,3)
heart.play

