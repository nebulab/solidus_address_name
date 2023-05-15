# frozen_string_literal: true

require_relative 'lib/solidus_address_name/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_address_name'
  spec.version = SolidusAddressName::VERSION
  spec.authors = ['Michelle Crisologo']
  spec.email = 'michelle.crisologo@gmail.com'

  spec.summary = 'Support Spree::Address.name'
  spec.description = <<~DESCRIPTION
    On Solidus 2.11 Spree::Address.name has been deprecated and completely removed from solidus 3.0. 
    This could not be a big problem for new customers, but creates some issues for the existing application.
    We would like to provide a quick way to backward compatibility with solidus 2.X even when solidus gets updated.
  DESCRIPTION
  spec.homepage = 'https://www.github.com/solidusio-contrib/solidus_address_name'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.4.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/solidusio-contrib/solidus_address_name'
  spec.metadata['changelog_uri'] = 'https://github.com/solidusio-contrib/solidus_address_name/blob/master/CHANGELOG.md'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.4', '< 4')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 4']
  spec.add_dependency 'solidus_support', '~> 0.5'

  spec.add_development_dependency 'solidus_dev_support', '~> 2.6'
end
