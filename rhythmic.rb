require "yaml"
require "rubygame"

require "./lib/loopable"

require "./lib/sound_providers/sound_provider"
require "./lib/sound_providers/rubygame_provider"

require "./lib/model/drumkit"
require "./lib/model/sample"

if defined?(Rubygame::Sound).nil?
  puts "Couldn't load SDL and SDL_Mixer. Are they correcly installed?. Please check https://github.com/rafadc/rythmic for installation instructions."
  exit
end

at_exit {(Thread.list - [Thread.current]).each(&:join)}