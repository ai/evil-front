# encoding: utf-8
# Load all neccessary libraries and files.

require 'pathname'

require 'sass-rails'
require 'slim-rails'
require 'role-rails'
require 'unicode_utils'
require 'jquery-rails-cdn'
require 'rails-sass-images'
require 'autoprefixer-rails'

dir = Pathname(__FILE__).dirname.join('evil-front')
require dir.join('version')
require dir.join('helpers')
require dir.join('railtie')
require dir.join('slim')
