# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mongoid/enum_mapper/version"

Gem::Specification.new do |spec|
  spec.name          = "mongoid_enum_mapper"
  spec.version       = Mongoid::EnumMapper::VERSION
  spec.authors       = ["Bernie Chiu"]
  spec.email         = ["bernie_chiu@hotmail.com"]

  spec.summary       = %q{This library supports a lightweight enum suger for Mongoid field.}
  spec.description   = %q{Enum mapper for Mongoid field}
  spec.homepage      = "https://github.com/berniechiu/mongoid_enum_mapper"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry-byebug", "~> 3.5.1"

  spec.add_dependency('mongoid', '<= 5.2.1')
end
