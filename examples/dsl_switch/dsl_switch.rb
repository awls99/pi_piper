require 'pi_facer'
include PiFacer

puts "Press the switch to get started"

watch :io => 1, :invert => true do |io| 
  puts "FIO changed from #{io.last_value} to #{io.value}"
end

PiFacer.wait

