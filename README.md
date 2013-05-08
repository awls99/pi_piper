## Overview

Pi Facer brings event driven programming to the Raspberry Pi's PiFace accessory.  
Pi Facer was designed for Ruby 2.0!
Pi Facer was based and inspired on <a href="https://github.com/jwhitehorn/pi_piper">Pi Piper</a> and uses <a href="https://github.com/blakejakopovic/piface">piface</a>, and such is still alpha as piface is.

To get started:

To install Pi Facer:

    sudo gem install pi_facer

### PIFACE
PiFace Digital plugs directly onto the top of your Raspberry Pi, and allows you to sense and control the real world.
2 Changeover relays
8 Open-collector outputs
8 Digital inputs
8 LED indicators
4 Switches
Graphical emulator and simulator

```ruby
require 'pi_facer'
include PiFacer

watch :io => 3 do
  puts "FIO changed from #{last_value} to #{value}"
end

PiFacer.wait
```

Your block will be called when a change to the pin's state is detected.

Additionally you can use the outputs too:

```ruby
pin = PiFacer::FIO.new(:io => 1, :direction => :out)
pin.on
sleep 1
pin.off
```


***
<img src="http://www.raspberrypi.org/wp-content/uploads/2012/03/Raspi_Colour_R.png" width="90" />

Proudly developed exclusively on a [Raspberry Pi](http://www.raspberrypi.org)
