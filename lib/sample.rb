class Sample
  SAMPLES_FOLDER = "samples"
  
  def initialize(sample_name)
    @sound = Rubygame::Sound.load("#{SAMPLES_FOLDER}/#{sample_name}")
    @delays = [0]
  end
  
  def play
    Thread.new do
      @delays.each do |delay|
        puts "Delayed #{delay}"
        sleep delay
        @sound.play
      end
    end
  end
  
  def play_after(*seconds)
    @delays = seconds
  end
end