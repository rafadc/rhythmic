class Drumkit
  DRUMKIT_FOLDER = "drumkits"

  attr_accessor :tempo, :length

  def initialize(drumkit_name = nil, tempo = 180, length = 4)
    @sounds = Hash.new
    load drumkit_name unless drumkit_name.nil?
    @tempo = tempo
    @length = length
  end

  def load(drumkit_name)
    drumkit_files = YAML::load(File.open("#{DRUMKIT_FOLDER}/#{drumkit_name}/#{drumkit_name}.yaml"))
    drumkit_files.each { |sounds_file_data|
      @sounds[sounds_file_data["name"]] =
          {:sound => Rubygame::Sound.load("#{DRUMKIT_FOLDER}/#{drumkit_name}/#{sounds_file_data['file']}")}
    }
  end

  def pattern(instrument, *beats_to_play)
    @sounds[instrument][:beats] = beats_to_play
  end

  def remove_from_playing(instrument)
    @sounds_to_play.delete instrument
  end

  def play(repetitions=1)
    @thread = Thread.new do
      seconds_between_beats = 60.0 / @tempo
      repetitions.times do
        @length.times do |beat|
          sounds_to_play_on_beat(beat).each { |sound_data| sound_data[:sound].play }
          sleep seconds_between_beats
        end
      end
    end
  end

  def play_sync(repetitions = 1)
    play(repetitions)
    @thread.join
  end

  def stop
    @thread.kill
  end

  private
  def sounds_to_play_on_beat(beat_number)
    @sounds.values.select { |sound| sound[:beats].nil? ? false : sound[:beats].include?(beat_number) }
  end
end