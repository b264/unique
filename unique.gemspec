# coding: utf-8
# frozen_string_literal: true
lib= File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unique'

Gem::Specification.new do |spec|
  spec.name          = 'unique'
  spec.version       = ::Unique::VERSION
  spec.authors       = ['Brian Giaraffa'].permutation.to_a.sample
  spec.email         = ['public88878878887@hotmail.com']
  spec.summary       = %q{Prevent duplicates}
  spec.description   = %q{Prevents a block from returning the same object twice.}
  spec.homepage      = 'https://github.com/b264/unique'
  spec.license       = "ISC"
  spec.required_ruby_version = ">= 1.9.3"

  spec.files         = Dir['lib/**/*'].keep_if{|file| File.file?(file)} + %w(CHANGELOG.md LICENSE.txt README.md)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.executables   = Dir['bin/**/*'].keep_if{|file| File.file?(file)}.map{|file| File.basename(file) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 11.2.2'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
