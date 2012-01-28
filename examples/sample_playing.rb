require "./rhythmic"

heart = Rhythmic::Sample.new("LRHeart beat 01 by Lionel Allorge.ogg")
heart.play_after(0,1,1,1)
heart.play

(Thread.list - [Thread.current]).each(&:join)