Gem::Specification.new do |s|
  s.name        = 'dice-roller'
  s.version     = '0.0.3'
  s.date        = '2016-03-16'
  s.summary     = "A ruby dice roller"
  s.description = "A clean way to roll complex dice structures"
  s.authors     = ["Emil Kampp"]
  s.email       = 'emil@kampp.me'
  s.files       = ["lib/dice.rb"]
  s.homepage    = 'https://github.com/DarkHeresyOnline/dice'
  s.license     = 'MIT'

  s.add_dependency 'expression_parser', '~> 0.9'
  s.add_dependency 'activesupport', '>= 4.2'
  s.add_runtime_dependency 'pry', '~> 0.10'
  s.add_runtime_dependency 'rspec', '~> 3.4'
  s.add_runtime_dependency 'simplecov', '~> 0.11'
end
