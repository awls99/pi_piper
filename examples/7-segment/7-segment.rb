require 'pi_facer'

s1 = PiFacer::FIO.new(:direction => :out, :io => 1)
s2 = PiFacer::FIO.new(:direction => :out, :io => 2)
s3 = PiFacer::FIO.new(:direction => :out, :io => 3)
s4 = PiFacer::FIO.new(:direction => :out, :io => 4)
s5 = PiFacer::FIO.new(:direction => :out, :io => 5)
s6 = PiFacer::FIO.new(:direction => :out, :io => 6)
s7 = PiFacer::FIO.new(:direction => :out, :io => 7)


pins = [s1, s2, s3, s4, s5, s6, s7]

zero = Proc.new { s1.on; s2.on; s3.on; s4.on; s5.on; s6.on; s7.off; }
one = Proc.new { s1.off; s2.off; s3.on; s4.on; s5.off; s6.off; s7.off; }
two = Proc.new { s1.off; s2.on; s3.on; s4.off; s5.on; s6.on; s7.on; }
three = Proc.new { s1.off; s2.on; s3.on; s4.on; s5.on; s6.off; s7.on; }
four = Proc.new { s1.on; s2.off; s3.on; s4.on;; s5.off; s6.off; s7.on; }
five = Proc.new { s1.on; s2.on; s3.off; s4.on; s5.on; s6.off; s7.on; }
six = Proc.new { s1.on; s2.on; s3.off; s4.on; s5.on; s6.on; s7.on; }
seven = Proc.new { s1.off; s2.on; s3.on; s4.on; s5.off; s6.off; s7.off; }
eight = Proc.new { s1.on; s2.on; s3.on; s4.on; s5.on; s6.on; s7.on; }
nine = Proc.new { s1.on; s2.on; s3.on; s4.on; s5.off; s6.off; s7.on; }

numbers = [zero, one, two, three, four, five, six, seven, eight, nine]

pins.each { |p| p.off }

PiFacer.watch :io => 4, :trigger => :rising do
  (0..250).each do
    pins.each { |p| p.update_value(Random.rand(2) == 1) }
  end
  number = Random.rand(10)
  numbers[number].call
end

PiFacer.wait
