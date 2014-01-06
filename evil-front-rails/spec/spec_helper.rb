ENV['RAILS_ENV'] ||= 'test'

require_relative 'app/config/environment'
require_relative '../lib/evil-front-rails'

require 'rspec/rails'
