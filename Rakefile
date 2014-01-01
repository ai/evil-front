# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

GEMS = %w(evil-front-core)

require 'rspec/core/rake_task'

class SubgemSpecTask < RSpec::Core::RakeTask
  attr_accessor :gem

  def initialize(gem)
    @gem = gem
    super("spec_#{@gem}")
  end

  def desc(text); end # Monkey  patch to hide task desc

  def pattern
    "#{@gem}/spec{,/*/**}/*_spec.rb"
  end
end

GEMS.each { |gem| SubgemSpecTask.new(gem) }

desc 'Run all specs'
task :spec => (GEMS.map { |i| "spec_#{i}" })
task :default => :spec
