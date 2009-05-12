#!/usr/bin/env ruby
dir = File.expand_path(File.dirname(__FILE__))
$: << dir unless $:.include?(dir)
require 'switchy'

class Sparky
  attr_accessor :passed, :failed, :pending
  
  @@run_pins = [[Switchy::PINS::C4, Switchy::PINS::C2], [Switchy::PINS::C5, Switchy::PINS::D0 ]]
  @@fail_pins = [[Switchy::PINS::C6, Switchy::PINS::D1], [Switchy::PINS::C7, Switchy::PINS::D2]]
  @@pending_pins = [[Switchy::PINS::B7, Switchy::PINS::D3], [Switchy::PINS::B6, Switchy::PINS::D4]]
  @@pass_pins = [[Switchy::PINS::B3, Switchy::PINS::D7, Switchy::PINS::B5, Switchy::PINS::D5],
                 [Switchy::PINS::B2, Switchy::PINS::B0, Switchy::PINS::B4, Switchy::PINS::D6]]

  @@reset_pins = [[Switchy::PINS::C4, Switchy::PINS::C2,
                  Switchy::PINS::C6, Switchy::PINS::D1,
                  Switchy::PINS::B7, Switchy::PINS::D3, 
                  Switchy::PINS::B5, Switchy::PINS::B3, 
                  Switchy::PINS::D7, Switchy::PINS::D5]]
  def initialize
    @passed, @failed, @pending = -1, -1, -1
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
  
  def set_pin(pin)
    @switchy.set_pin pin.first, 1
    @switchy.set_pin pin.last, 0
  end
  
  def clear_pin(pin)
    @switchy.set_pin pin.first, 0
  end
  
  def clear_pins(pins)
    pins.first.each do |pin|
      @switchy.set_pin pin, 0
    end
  end
  
  def pass
    set_pins @@pass_pins
  end
  alias :passed :pass
  
  def clear_pass
    clear_pins @@pass_pins
  end
  
  def fail
    set_pins @@fail_pins
  end
  alias :failed :fail
  
  def clear_failed
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
  
  def start_run
    reset
    run
  end
  
  def finish_run
    reset
    if @failed > -1
      failed
    elsif @pending > -1
      pending
    else
      pass
    end
  end
  
  def example_passed
    clear_pin pin(:passed, @passed % 4) if @passed >= 0
    @passed += 1
    set_pin pin(:passed, @passed % 4)
  end
  
  def example_failed
    clear_pin pin(:failed, @failed % 2) if @failed >= 0
    @failed += 1
    set_pin pin(:failed, @failed % 2)
  end
  
  def example_pending
    clear_pin pin(:pending, @pending % 2) if @pending >= 0
    @pending += 1
    set_pin pin(:pending, @pending % 2)
  end
  
  def pin(set, idx)
    pins = case set
           when :passed then @@pass_pins
           when :failed then @@fail_pins
           when :pending then @@pending_pins
           end
    [ pins.first[idx], pins.last[idx] ]
  end
end

