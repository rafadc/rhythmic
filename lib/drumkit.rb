require "yaml"
require "rubygame"

class Drumkit
  DRUMKIT_FOLDER = "drumkits"
  
  attr_accesor :tempo, :lenght
  
  def initialize
    @sounds = Hash.new
  end
  
  def load(drumkit_name)
    drumkit_files = YAML::load(File.open("#{DRUMKIT_FOLDER}/#{drumkit_name}/#{drumkit_name}.yaml"))
    drumkit_files.each {|sounds_file_data| 
      @sounds[sounds_file_data["name"]] = 
        {:sound => Rubygame::Sound.load("#{DRUMKIT_FOLDER}/#{drumkit_name}/#{sounds_file_data['file']}")}
    }
  end
  
  def pattern_for_instrument(instrument, *beats_to_play)
    @sounds[instrument][:beats] = beats_to_play
  end
  
  def remove_from_playing(instrument)
    @sounds_to_play.delete instrument
  end
end