require 'piface'
Dir[File.dirname(__FILE__) + '/pi_facer/*.rb'].each {|file| require file }

module PiPiper
  extend self
  
  #Defines an event block to be executed when an event occurs.
  #
  # == Parameters:
  # options:
  #   Options hash. Options include `:pin`, `:invert` and `:trigger`.
  # 
  def watch(options, &block)
    Thread.new do
      pin = PiPiper::Pin.new(options)
      loop do
        pin.wait_for_change 
        if block.arity > 0
          block.call pin
        else
          pin.instance_exec &block
        end
      end 
    end.abort_on_exception = true  
  end
  
  #Defines an event block to be executed after a pin either goes high or low.
  #
  # @param [Hash] options A hash of options
  # @option options [Fixnum] :pin The pin number to initialize. Required.
  # @option options [Symbol] :goes The event to watch for. Either :high or :low. Required.
  def after(options, &block)
    options[:trigger] = options.delete(:goes) == :high ? :rising : :falling
    watch options, &block
  end

  #Prevents the main thread from exiting. Required when using PiPiper.watch
  def wait
    loop do sleep 1 end
  end

end
