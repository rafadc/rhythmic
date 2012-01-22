require "yaml"
require "rubygame"
require "./lib/drumkit"
require "./lib/sample"

if defined?(Rubygame::Sound).nil?
  puts "Couldn't load SDL and SDL_Mixer. Are they correcly installed?. Please check https://github.com/rafadc/rythmic for installation instructions."
  exit
end


