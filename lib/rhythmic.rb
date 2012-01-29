require "yaml"
require "rubygame"

require "./lib/rhythmic/loopable"

require "./lib/rhythmic/sound_provider"
require "./lib/rhythmic/rubygame_provider"

require "./lib/rhythmic/drumkit_loader_yaml"
require "./lib/rhythmic/drumkit"
require "./lib/rhythmic/sample"
require "./lib/rhythmic/song"

if defined?(Rubygame::Sound).nil?
  puts "Couldn't load SDL and SDL_Mixer. Are they correcly installed?. Please check https://github.com/rafadc/rythmic for installation instructions."
  exit
end

at_exit {(Thread.list - [Thread.current]).each(&:join)}