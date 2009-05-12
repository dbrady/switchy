require 'rubygems'
require 'spec/runner/formatter/progress_bar_formatter'
$: << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sparky'

# TODO: rewire this to just patch the base class like I did in
# sparky_cucumber.rb. May be problematic as the child classes here
# ain't so good at calling super, so I may just need to patch the key
# formatters I normally use like ProgressBar and Html.

module Spec
  module Runner
    module Formatter
      class SparkyProgressFormatter < ProgressBarFormatter
        @@anything_failed_ever = false
        @@anything_pended_ever = false
        
        def initialize(a,b)
          super
          @sparky = Sparky.new
          @sparky.start_run
        end

        def start_dump
          @sparky.finish_run
          super
        end
        
        def example_passed(example)
          @sparky.example_passed
          super
        end
        
        def example_failed(example, counter, failure)
          @@anything_failed_ever = true
          @sparky.example_failed
          super
        end
        
        def example_pending(example, message)
          @@anything_pended_ever = true
          @sparky.example_pending
          super
        end
      end
    end
  end
end
