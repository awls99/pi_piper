require 'pi_facer'

puts "Press the switch to get started"

PiFacer.watch :io => 1, :invert => true do |pin|
  puts "Pin changed from #{pin.last_value} to #{pin.value}"
end

PiFacer.wait

