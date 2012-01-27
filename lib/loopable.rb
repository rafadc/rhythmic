module Rhythmic
  module Loopable
    def loop
      @thread = Thread.new do
        play_sync while true
      end
    end
  end
end