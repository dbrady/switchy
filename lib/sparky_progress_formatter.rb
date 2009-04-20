require 'rubygems'
require 'spec/runner/formatter/progress_bar_formatter'
$: << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sparky'

module Spec
  module Runner
    module Formatter
      class SparkyProgressFormatter < ProgressBarFormatter
        @@anything_failed_ever = false
        @@anything_pended_ever = false
        
        def initialize(a,b)
          super
          @sparky = Sparky.new
          @sparky.reset
          @sparky.run
        end

        def start_dump
          @sparky.clear_run
          super
        end
        
        def example_passed(example)
          unless @@anything_pended_ever || @@anything_failed_ever
            @sparky.pass
          end
          super
        end
        
        def example_failed(example, counter, failure)
          unless @@anything_failed_ever
            @@anything_failed_ever = true
            @sparky.clear_pass
            @sparky.clear_pending
            @sparky.fail
          end
          super
        end
        
        def example_pending(example, message, pending_caller)
          unless @@anything_pended_ever || @@anything_failed_ever
            @@anything_pended_ever = true
            @sparky.clear_pass
            @sparky.pending
          end
          super
        end
      end
    end
  end
end
