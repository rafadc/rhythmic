module Rhythmic
  class Sample
    include Loopable

    SAMPLES_FOLDER = "samples"

    def initialize(sample_name)
      @sound = Rubygame::Sound.load("#{SAMPLES_FOLDER}/#{sample_name}")
      @delays = [0]
    end

    def play_sync
      play
      @thread.join
    end

    def play
      @thread = Thread.new do
        @delays.each do |delay|
          sleep delay
          @sound.play
        end
      end
    end

    def stop
      @thread.kill
    end

    def play_after(*seconds)
      @delays = seconds
    end
  end
end