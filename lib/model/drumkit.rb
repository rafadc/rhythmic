module Rhythmic
  class Drumkit
    include Rhythmic::Loopable

    attr_accessor :tempo, :length
    attr_writer :drumkit_loader

    def initialize(drumkit_name = nil, tempo = 180, length = 4)
      @patterns = []
      load drumkit_name unless drumkit_name.nil?
      @tempo = tempo
      @length = length
    end

    def load(drumkit_name)
      puts "Loading #{get_drumkit_loader.load(drumkit_name)}"
      @sounds = get_drumkit_loader.load(drumkit_name)
    end

    def pattern(instrument, pattern_number, *beats_to_play)
      @patterns[pattern_number] = Hash.new if @patterns[pattern_number].nil?
      @patterns[pattern_number][instrument] = beats_to_play
    end

    def play
      @thread = Thread.new do
        seconds_between_beats = 60.0 / @tempo
        @patterns.size.times do |pattern_number|
          play_pattern(pattern_number, seconds_between_beats)
        end
      end
    end

    def play_sync
      play
      @thread.join
    end

    def stop
      @thread.kill
    end

    private
    def sounds_to_play_on_beat(pattern_number, beat_number)
      patterns_with_beat = @patterns[pattern_number].select do |k, v|
        v.nil? ? false : v.include?(beat_number)
      end
      patterns_with_beat.keys
    end

    def play_pattern(pattern_number, seconds_between_beats)
      @length.times do |beat|
        sounds_to_play_on_beat(pattern_number, beat).each do |sound_to_play|
          @sounds[sound_to_play].play
        end
        sleep seconds_between_beats
      end
    end

    def get_drumkit_loader
      @drumkit_loader ||= DrumkitLoaderYaml.new
    end
  end
end