module Pifacer
	# Represents a Piface io on the Raspberry Pi
	class FIO
		attr_reader :io, :last_value, :value, :direction, :invert
		
		#Initializes a new Piface io.
		#
		# @param [Hash] options A hash of options
		# @option options [Fixnum] :io The io number to initialize. Required.
		# @option options [Symbol] :direction The direction of communication, either :in or :out. Defaults to :in.
		# @option options [Boolean] :invert Indicates if the value read from the physical io should be inverted. Defaults to false.
		# @option options [Symbol] :trigger Indicates when the wait_for_change method will detect a change, either :rising, :falling, or :both edge triggers. Defaults to :both.
		def initialize(direction: :in, invert: true, **options)
			raise "Invalid direction. Options are :in or :out" unless [:in, :out].include? @direction
			raise "Invalid IO, Piface IO numbers go from 0 to 7" unless (0..7).include options[:io]

			@io        = options[:io]
			@direction = direction
			@invert    = invert
		 
			read
		end
		
		# If the io has been initialized for output this method will set the logic level high.
		def on
			Piface.write( @io, 1 )  if direction == :out
		end
		
		# Tests if the logic level is high.
		def on?
			not off?
		end
		
		# If the io has been initialized for output this method will set the logic level low.
		def off
			Piface.write( @io, 0 )  if direction == :out
		end
		
		# Tests if the logic level is low.
		def off?
			value == 0
		end

		# If the io has been initialized for output this method will either raise or lower the logic level depending on `new_value`.
		# @param [Object] new_value If false or 0 the io will be set to off, otherwise on.
		def update_value(new_value)
			!new_value || new_value == 0 ? off : on
		end
		
		# Tests if the logic level has changed since the io was last read.
		def changed?
			read
			last_value != value
		end

		# blocks until a logic level change occurs. The initializer option `:trigger` modifies what edge this method will release on.
		def wait_for_change
			loop do
				break if changed?
			end
		end

		def read 
			@last_value = @value
			val         = Piface.read @io
			@value      = invert ? (val ^ 1) : val
		end
		
	end
end
