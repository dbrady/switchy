#!/usr/bin/env ruby

require "serialport"

class Switchy
  attr_accessor :modem, :baud
  def initialize(modem = '/dev/tty.usbmodem12341', baud=38400)
    @modem, @baud = modem, baud
    connect
  end
  
  def connect
    @sp = SerialPort.new @modem, @baud
    puts "Connected"
  end
  
  def disconnect
    # ???
  end
  
#   def light1; lights[1]; end
#   def light2; lights[2]; end
#   def light3; lights[3]; end
#   def light4; lights[4]; end

#   def light1(v); lights[1] = v; end
#   def light2(v); lights[2] = v; end
#   def light3(v); lights[3] = v; end
#   def light4(v); lights[4] = v; end
  
  def set_light(l, v)
    cmd = "C#{l+3}=#{v}\r\n"
    puts cmd
    @sp.write cmd
  end
  
  def light1=(v)
    set_light 1, v
  end
  
  def light2=(v)
    set_light 2, v
  end
  
  def light3=(v)
    set_light 3, v
  end
  
  def light4=(v)
    set_light 4, v
  end
  
end
