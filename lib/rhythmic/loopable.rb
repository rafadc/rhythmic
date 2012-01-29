module Rhythmic
  module Loopable
    def loop
      @loop_thread = Thread.new do
        @looping = true
        play_sync while @looping
      end
    end

    def stop_loop
      @looping = false
    end
  end
end