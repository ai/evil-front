require 'rubygems'
require 'bundler/setup'

GEMS  = %w(evil-front evil-front-rails evil-front-all)
SPECS = GEMS - ['evil-front-all', 'evil-front-rails']

def each_gem(&block)
  GEMS.each do |dir|
    Dir.chdir(dir, &block)
  end
end

def rake(task)
  sh "#{Rake::DSL::RUBY} -S bundle exec rake #{task}", verbose: false
end

def each_rake(task)
  each_gem { rake task }
end

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

SPECS.each { |gem| SubgemSpecTask.new(gem) }

desc 'Run all specs'
task :spec => (SPECS.map { |i| "spec_#{i}" })
task :default => :spec


task :build do
  each_rake 'build'
end

desc 'Build gems and push thems to RubyGems'
task :release => [:clobber, :build] do
  each_gem { sh 'gem push `ls pkg/*`' }
  each_rake 'clobber'
end

desc 'Remove all generated files'
task :clobber do
  rm_r 'log' if File.exists? 'log'
  each_rake 'clobber'
end
