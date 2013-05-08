require 'pi_facer'
include PiFacer

puts "Press the switch to get started"

watch :io => 1, :invert => true do 
  puts "FIO changed from #{last_value} to #{value}"
end

PiFacer.wait

