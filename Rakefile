# encoding: utf-8

require 'rubygems'

begin
  require 'bundler/setup'
  Bundler::GemHelper.install_tasks
rescue LoadError
  puts "Bundler not available. Install it with: gem install bundler"
end

task :clobber_package do
  rm_r 'pkg' rescue nil
end

desc 'Delete all generated files'
task :clobber => [:clobber_package]
