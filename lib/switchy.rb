#!/usr/bin/env ruby

require "serialport"

class Switchy
  module PINS
    B0 = "B0"
    B1 = "B1"
    B2 = "B2"
    B3 = "B3"
    B4 = "B4"
    B5 = "B5"
    B6 = "B6"
    B7 = "B7"

    C2 = "C2"
    C4 = "C4"
    C5 = "C5"
    C6 = "C6"
    C7 = "C7"
    
    D0 = "D0"
    D1 = "D1"
    D2 = "D2"
    D3 = "D3"
    D4 = "D4"
    D5 = "D5"
    D6 = "D6"
    D7 = "D7"
    
    OC1B = "C5"

    OC1A = "C6"
    
    ICP1 = "C7"
    INT4 = "C7"
    
    OC1C = "B7"

    T1 = "B4"

    M1S0 = "B3"

    M0S1 = "B2"

    SCLK = "B1"
    
    SS = "B0"
    
    INT7 = "D7"
    HWB = "D7"
    CTS = "D7"
    T0 = "D7"
    
    INT6 = "D6"
    RTS = "D6"
    LED = "D6"
    
    XCK = "D5"
    
    INT5 = "D4"
    
    INT3 = "D3"
    TXD1 = "D3"
    TXD = "D3"
    
    INT2 = "D2"
    AIN1 = "D2"
    RXD1 = "D2"
    RXD = "D2"
    
    INT1 = "D1"
    AIN0 = "D1"
    
    INT0 = "D0"
    OC0B = "D0"

    PD0 = "D0"
    PD1 = "D1"
    PD2 = "D2"
    PD3 = "D3"
    PD4 = "D4"
    PD5 = "D5"
    PD6 = "D6"
    PD7 = "D7"
  end

  attr_accessor :modem, :baud
  
  def initialize(modem = '/dev/tty.usbmodem12341', baud=38400)
    @modem, @baud = modem, baud
    connect
  end
  
  def connect
    @sp = SerialPort.new @modem, @baud
  end
  
  def disconnect
    # ???
  end
  
  # Set pin "b4", 1 # turn on pin b4
  def set_pin(p, v)
    cmd = "#{p.upcase}=#{v}\r\n"
    @sp.write cmd
  end
    
  def set_light(l, v)
    cmd = "C#{l+3}=#{v}\r\n"
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

