class Sample
  SAMPLES_FOLDER = "samples"
  
  def initialize(sample_name)
    @sound = Rubygame::Sound.load("#{SAMPLES_FOLDER}/#{sample_name}")
  end
  
  def play
    @sound.play
  end
end