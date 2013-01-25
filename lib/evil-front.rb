# encoding: utf-8
# Load all neccessary libraries and files.

require 'sass-rails'
require 'slim-rails'
require 'role-rails'
require 'compass-rails'
require 'ceaser-easing'
require 'jquery-rails-cdn'

dir = File.join(File.dirname(__FILE__), 'evil-front')
require File.join(dir, 'version')
require File.join(dir, 'helpers')
require File.join(dir, 'railtie')
require File.join(dir, 'slim')
