require 'piface'
Dir[File.dirname(__FILE__) + '/pi_facer/*.rb'].each {|file| require file }

module PiFacer
	extend self
	
	#Defines an event block to be executed when an event occurs.
	#
	# == Parameters:
	# options:
	#   Options hash. Options include `:pin`, `:invert` and `:direction`.
	# 
	def watch(options, &block)
		Thread.new do
			pin = PiFacer::FIO.new(options)
			loop do
				pin.wait_for_change 
				yield pin
			end 
		end.abort_on_exception = true  
	end
	
	#Prevents the main thread from exiting. Required when using PiFacer.watch
	def wait
		loop do sleep 1 end
	end

end
