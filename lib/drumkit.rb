require "yaml"
require "rubygame"

class Drumkit
  DRUMKIT_FOLDER = "drumkits"
  
  attr_accessor :tempo, :lenght
  
  def initialize(drumkit_name = nil, tempo = 180, lenght = 4)
    @sounds = Hash.new
    load drumkit_name unless drumkit_name.nil?
    @tempo = tempo
    @lenght = lenght
  end
  
  def load(drumkit_name)
    drumkit_files = YAML::load(File.open("#{DRUMKIT_FOLDER}/#{drumkit_name}/#{drumkit_name}.yaml"))
    drumkit_files.each {|sounds_file_data| 
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
  
  def sounds_to_play_on_beat(beat_number)
    @sounds.values.select {|sound| sound[:beats].nil? ? false : sound[:beats].include?(beat_number) }
  end
  
  def play(repetitions=1)
    seconds_between_beats = 60.0 / @tempo
    repetitions.times do
      @lenght.times do |beat|
        sounds_to_play_on_beat(beat).each{ |sound_data| sound_data[:sound].play }
        sleep seconds_between_beats
      end
    end
  end
end