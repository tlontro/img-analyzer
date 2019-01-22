Gem::Specification.new do |spec|
  spec.name        = 'img_analyzer'
  spec.version     = '0.0.1'
  spec.date        = '2018-08-28'
  spec.summary     = "A gem to compare and highlight image compairison"
  spec.description = "This gem will compare two images and highlight the differences in a third one"
  spec.authors     = ["Tiago Silva"]
  spec.email       = 'tiagomiguellsilva@gmail.com'
  spec.files       = ["lib/img_analyzer.rb"]
  spec.homepage    = 'http://rubygems.org/gems/img_analyzer'
  spec.license     = 'MIT'
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency 'chunky_png'
  spec.add_runtime_dependency 'oily_png'
  spec.add_runtime_dependency 'fileutils'
end
