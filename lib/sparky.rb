#!/usr/bin/env ruby
dir = File.expand_path(File.dirname(__FILE__))
$: << dir unless $:.include?(dir)
require 'switchy'

class Sparky
  @@run_pins = [[Switchy::PINS::C4, Switchy::PINS::C2], [Switchy::PINS::C5, Switchy::PINS::D0 ]]
  @@fail_pins = [[Switchy::PINS::C6, Switchy::PINS::D1], [Switchy::PINS::C7, Switchy::PINS::D2]]
  @@pending_pins = [[Switchy::PINS::B7, Switchy::PINS::D3], [Switchy::PINS::B6, Switchy::PINS::D4]]
  @@pass_pins = [[Switchy::PINS::B5, Switchy::PINS::B3, Switchy::PINS::D7, Switchy::PINS::D5],
                 [Switchy::PINS::B4, Switchy::PINS::B2, Switchy::PINS::B0, Switchy::PINS::D6]]

  @@reset_pins = [[Switchy::PINS::C4, Switchy::PINS::C2,
                  Switchy::PINS::C6, Switchy::PINS::D1,
                  Switchy::PINS::B7, Switchy::PINS::D3, 
                  Switchy::PINS::B5, Switchy::PINS::B3, 
                  Switchy::PINS::D7, Switchy::PINS::D5]]
  def initialize
    @switchy = Switchy.new
  end
  
  def set_pins(pins)
    pins.first.each do |pin|
      @switchy.set_pin pin, 1
    end
    pins.last.each do |pin|
      @switchy.set_pin pin, 0
    end
  end
  
  def clear_pins(pins)
    pins.first.each do |pin|
      @switchy.set_pin pin, 0
    end
  end
  
  def pass
    set_pins @@pass_pins
  end
  
  def clear_pass
    clear_pins @@pass_pins
  end
  
  def fail
    set_pins @@fail_pins
  end
  
  def clear_fail
    clear_pins @@fail_pins
  end

  def pending
    set_pins @@pending_pins
  end

  def clear_pending
    clear_pins @@pending_pins
  end

  def run
    set_pins @@run_pins
  end
  
  def clear_run
    clear_pins @@run_pins
  end
  
  def reset
    clear_pins @@reset_pins
  end
end

