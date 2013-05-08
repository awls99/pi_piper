require 'pi_piper'

puts "Press the switch to get started"
pin17 = PiFacer::FIO.new(:io => 0, :direction => :out)
pin27 = PiFacer::FIO.new(:io => 1, :direction => :out)

pin17.off
pin27.off

sum = 0

PiFacer.watch :io => 0, :trigger => :rising do |pin|
  sum += 1
  puts sum 

  # get single bits of sum
  pin17.update_value(sum & 0b01 == 0b01) 
  pin27.update_value(sum & 0b10 == 0b10)
end

PiFacer.wait
