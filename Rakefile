# coding: utf-8
# frozen_string_literal: true
require 'bundler'
Bundler::GemHelper.install_tasks

namespace :spec do
  desc 'Runs all tests'
  task :all do
    system 'rspec --colour --pattern spec/**/*_spec.rb'
  end
end

task default: ['spec:all']
