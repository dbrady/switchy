#!/usr/bin/env ruby

class Speccle
  def self.run(args)
    args = args.map {|arg| arg =~ /\s/ ? arg.inspect : arg }
    libdir = File.expand_path(File.dirname(__FILE__))
    cmd = "spec --require #{libdir}/iterm_color_progress_formatter.rb --format Spec::Runner::Formatter::ItermColorProgressFormatter #{args * ' '}"
    system cmd
  end
end

