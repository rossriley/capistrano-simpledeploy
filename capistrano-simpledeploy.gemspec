# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-simpledeploy'
  spec.version       = '0.0.1'
  spec.authors       = ["Ross Riley"]
  spec.email         = ["riley.ross@gmail.com"]
  spec.description   = %q{An extension to handle single version deploys for Capistrano 3.x}
  spec.summary       = %q{An extension to handle single version deploys for Capistrano 3.x}
  spec.homepage      = 'https://github.com/rossriley/capistrano-single-deploy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.1'
  spec.add_dependency 'capistrano-bundle'
  spec.add_dependency 'capistrano-compose'
  spec.add_dependency 'capistrano-simplegit'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
