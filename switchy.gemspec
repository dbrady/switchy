spec = Gem::Specification.new do |s|
  s.name = 'switchy'
  s.version = '0.3.0'
  s.date = '2013-04-06'
  s.summary = 'Switchy USB serial load switcher'
  s.email = "github@shinybit.com"
  s.homepage = "http://github.com/dbrady/switchy"
  s.description = "Switchy USB serial load switcher"
  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--main", "README.rdoc", "--title", "Switchy -  USB serial load switcher"]
  s.executables = ["switchy", "sparky", "sparcumber"]
  s.extra_rdoc_files = ["README.md", "MIT-LICENSE"]
  s.authors = ["David Brady"]
  s.add_dependency('serialport')
  s.license = "MIT"


  # ruby -rpp -e "pp (Dir['{README,{examples,lib,protocol,spec}/**/*.{rdoc,json,rb,txt,xml,yml,opts}}'] + Dir['bin/*']).sort"
  s.files = ["bin/sparky",
             "bin/switchy",
             "bin/sparcumber",
             "lib/sparky.rb",
             "lib/sparky_cucumber.rb",
             "lib/sparky_progress_formatter.rb",
             "res/spec.sparky.opts",
             "lib/switchy.rb"]
end
