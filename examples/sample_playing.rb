require "./rhythmic"

your_in = Rhythmic::Sample.new("YourInOrYourOut.wav")
your_in.play_after(0,3,3,3)
your_in.play

