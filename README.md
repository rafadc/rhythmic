# RMU personal project

## Rhythmic

It is just a simple drum machine that can also play loops but can be used interactively from Ruby console

## Installation
 
Rhythmic requires SDL installed.

To install on MacOSX you must run 

    brew install sdl sdl_mixer

Also, some versions of readline are blocking so if you experience sounds not being played you must add the following line to $HOME/.irb:

  	IRB.conf[:USE_READLINE] = false

Unluckly then your history keys will stop working in irb


## Using rhythmic

Rhythmic is used through irb so one you've checked out rythmic code go to installation directory and type "irb"

Now, in irb prompt try the following to check that your installation was correct

    irb(main):001:0> load "examples/drumkit_example.rb"
    => true

That should put some sound in your speakers or raise an error in case SDL is not installed.

You will be presented with a ruby console where you can start using the drum machine

For example if you type the following

    irb(main):001:0> require "./rhythmic"
    => true
    irb(main):002:0> drums = Drumkit.new "gmkit"
    [...]
    irb(main):003:0> drums.pattern("kick", 0, 1)
    [...]
    irb(main):004:0> drums.pattern("tom_hi", 2)
    [...]
    irb(main):005:0> drums.play 4

You'll here four times the pattern we just defined. The kick in the first and second beat and the tom in the third. The fourh beat will be on silence. 

Then you can play with the tempo. If you do

    drums.tempo = 200
    [...]
    drums.play 4
    [...]

You'll hear your drums faster.

You can also change the lenght of a loop. If you do

    drums.lenght = 2
    [...]
    drums.play 4
    [...]

You'll only hear kicks all the way since the loop ends in the second beat.

## Defining new drumkits

Rhythmic just fires samples located in drumkit folder. To create a new drumkit just create a new folder with the name of the drumkit. Inside it you must place a yaml file like the following

    [{name : kick, file : clap_Dry_c.wav},
    {name : tom_hi, file : tom_Rock_mid.wav}]
	
That will look for "clap_Dry_c.wav" file in drumkit folder and assign it to "kick" so you can use it from "pattern" method. The same will be done for "tom_hi". At the moment WAV, OGG and MP3 samples are supported.

## Sounds copyright

I got some sounds to be used as examples. They are distributed under different licenses. Their copyright holders are:

 * GmKit drumkit: The hydrogen team
 * Hearbeat sample: Lionel Allorge
