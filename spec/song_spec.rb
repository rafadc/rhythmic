require "rspec"

require_relative("../rhythmic")

describe "Song playing" do

  it "should play a drumkit and a loop if added to a song" do
    drumkit = double("Drumkit")
    loop = double("Loop")
    song = Rhythmic::Song.new
    song.add drumkit
    song.add loop
    drumkit.should_receive(:play)
    loop.should_receive(:play)
    song.play
  end
end