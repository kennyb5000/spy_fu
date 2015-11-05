# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spy_fu/version'

Gem::Specification.new do |spec|
  spec.name          = 'spy_fu'
  spec.version       = SpyFu::VERSION
  spec.authors       = ['Kenny Browne']
  spec.email         = ['kbrowne@g2crowd.com']

  spec.summary       = 'A simple gem to interact with the SpyFu api'
  spec.description   = %q{This gem is meant to handle all of the dependencies necessary to connect and make requests with the SpyFu api.
                          An account with SpyFu is necessary to access the api https://www.spyfu.com/o/spyfu-api/.
                          The api documentation is detailed: https://www.spyfu.com/o/spyfu-api/documentation/overview-secure.aspx}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = ['lib/spy_fu.rb', 'LICENSE.txt', 'Rakefile', 'README.md']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 1.0'
  spec.add_development_dependency 'rake', '>= 10.0'
  spec.add_development_dependency 'rspec', '>= 0'
  spec.add_development_dependency 'webmock', '>= 0'
  spec.add_dependency 'httparty', '>= 0.9'
  spec.add_dependency 'activesupport', '>= 3.0'
end
