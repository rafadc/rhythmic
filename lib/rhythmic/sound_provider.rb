module Rhythmic
  module SoundProvider
    attr_writer :sound_provider

    def self.load(filename)
      get_sound_provider.load filename
    end

    private
    def self.get_sound_provider
      @sound_provider ||= RubygameProvider.new
    end
  end
end