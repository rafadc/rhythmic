module Rhythmic

  class DrumkitLoaderYaml

    DRUMKIT_FOLDER = "drumkits"

    def load(drumkit_name)
      sounds=Hash.new
      drumkit_files = YAML::load(File.open("#{DRUMKIT_FOLDER}/#{drumkit_name}/#{drumkit_name}.yaml"))
      drumkit_files.each do |sounds_file_data|
        sounds[sounds_file_data["name"]] =
            SoundProvider.load("#{DRUMKIT_FOLDER}/#{drumkit_name}/#{sounds_file_data['file']}")
      end
      sounds
    end
  end

end