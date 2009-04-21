spec = Gem::Specification.new do |s|
  s.name = 'switchy'
  s.version = '0.1.1'
  s.date = '2009-04-19'
  s.summary = 'Switchy USB serial load switcher'
  s.email = "github@shinybit.com"
  s.homepage = "http://github.com/dbrady/switchy"
  s.description = "Switchy USB serial load switcher"
  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--main", "README.rdoc", "--title", "Switchy -  USB serial load switcher"]
  s.executables = ["switchy", "sparky"]
  s.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE"]
  s.authors = ["David Brady"]
  s.add_dependency('ruby-serialport')


  # ruby -rpp -e "pp (Dir['{README,{examples,lib,protocol,spec}/**/*.{rdoc,json,rb,txt,xml,yml}}'] + Dir['bin/*']).sort"
  s.files = ["bin/sparky",
             "bin/switchy",
             "lib/sparky.rb",
             "lib/sparky_progress_formatter.rb",
             "res/spec.sparky.opts",
             "lib/switchy.rb"]
end
