require 'sparky'

module Cucumber
  module Ast
    class Visitor

      alias :orig_visit_step_result :visit_step_result
      alias :orig_visit_features :visit_features
      
      def visit_features(features)
        @sparky = Sparky.new
        @sparky.start_run
        orig_visit_features(features)
        @sparky.finish_run
      end

      def visit_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background)
        @sparky.send "example_#{status}" if [:passed, :failed, :pending].include?(status)
        orig_visit_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background)
      end 
    end 
  end
end
