Gem::Specification.new do |s|
  s.name        = 'dice'
  s.version     = '0.0.1'
  s.date        = '2016-03-16'
  s.summary     = "A ruby dice roller"
  s.description = "A clean way to roll complex dice structures"
  s.authors     = ["Emil Kampp"]
  s.email       = 'emil@kampp.me'
  s.files       = ["lib/dice.rb"]
  s.homepage    = 'http://emil.kampp.me'
  s.license     = 'MIT'

  s.add_dependency 'expression_parser'
  s.add_dependency 'activesupport'
  s.add_runtime_dependency 'pry'
  s.add_runtime_dependency 'rspec'
  s.add_runtime_dependency 'simplecov'
end
