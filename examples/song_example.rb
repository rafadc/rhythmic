require "./rhythmic"

demo_song = Rhythmic::Song.new

drums = Rhythmic::Drumkit.new("gmkit", 230, 10)
drums.pattern("clap", 0, [0, 2, 4, 6, 8, 10])
drums.copy_pattern(0, 1)
drums.copy_pattern(0, 2)
drums.copy_pattern(0, 3)
drums.copy_pattern(0, 4)
drums.copy_pattern(0, 5)
demo_song.add drums

your_in = Rhythmic::Sample.new("YourInOrYourOut.wav")
your_in.volume = 0.7
your_in.play_after(0, 4, 4, 4, 4, 4)
demo_song.add your_in

your_smokin = Rhythmic::Sample.new("YourSmokin.wav")
your_smokin.play_after(10, 4)
demo_song.add your_smokin

thank_you = Rhythmic::Sample.new("IJustWannaThankYou.wav")
thank_you.play_after(18)
demo_song.add thank_you

demo_song.play

