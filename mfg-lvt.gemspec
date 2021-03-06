Gem::Specification.new do |s|
  s.name        = "mfg-lvt"
  s.email       = "lvtho129@gmail.com"
  s.version     = "0.1.5"
  s.date        = "2017-06-21"
  s.summary     = "Suggest musics, films or games"
  s.description = "Suggest musics, films or games"
  s.authors     = ["Lvtho"]
  s.files       = "lib/mfg-lvt.rb"
  s.executables << "mfg-lvt"
  s.homepage    = "https://github.com/at-thole/mfg-lvt"
  s.license     = "MIT"
  s.bindir      = "bin"

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_runtime_dependency "colorize"
  s.add_runtime_dependency "nokogiri"
end
