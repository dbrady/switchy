spec = Gem::Specification.new do |s|
  s.name = 'switchy'
  s.version = '0.0.4'
  s.date = '2009-04-17'
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
  s.files = ["bin/switchy",
             "bin/sparky",
             "lib/switchy.rb"
            ]
end
