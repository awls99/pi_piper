require 'rubygems'  
require 'rake'  
require 'echoe'  
  
Echoe.new('pi_facer', '0.0.1') do |p|  
  p.description     = "Event driven Raspberry PIFace library"  
  p.url             = "http://github.com/awls99/pi_piper"  
  p.author          = "Arthur Silva"  
  p.email           = "awls99@gmail.com"  
  p.ignore_pattern  = ["examples/**/*"]  
  p.dependencies = ['piface']  
end  
  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }  
