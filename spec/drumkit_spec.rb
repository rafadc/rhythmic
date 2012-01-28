require "rspec"

require_relative("../rhythmic")

def wait_for_threads_to_finish
  (Thread.list - [Thread.current]).each(&:join)
end

describe "Playing sounds" do

  let (:sound_provider) do
    sound_provider = double("SoundProvider")
    sound_provider.stub(:load)
    sound_provider
  end

  let(:drumkit_loader) do
    @kick_sound = double("Sound")
    @tom_sound = double("TomSound")
    drumkit_loader = double("DrumkitLoader")
    drumkit_loader.stub(:load).and_return({"kick" => @kick_sound,
                                           "tom" => @tom_sound})
    drumkit_loader
  end

  it "should play if a single sound in pattern 0 set" do
    drumkit = Rhythmic::Drumkit.new
    drumkit.drumkit_loader = drumkit_loader
    drumkit.load "my drumkit"
    drumkit.pattern("kick", 0, 0)
    drumkit.play
    @kick_sound.should_receive(:play)
    wait_for_threads_to_finish
  end
end