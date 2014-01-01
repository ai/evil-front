# encoding: utf-8
# Load all neccessary libraries and files.

require 'pathname'

require 'slim'
require 'sass'
require 'sprockets'
require 'rails-sass-images'

module EvilFront
  autoload :Russian, 'evil-front/russian'

  if defined?(::Rails)
    # Enable `lib/assets/` and `vendor/assets/` in Rails app.
    class Engine < ::Rails::Engine
    end
  end

  # Install Evil Front to standalone Sprockets environment.
  def self.install(sprockets)
    RailsSassImages.install(sprockets)

    root = Pathname(__FILE__).dirname.join('..')
    sprockets.append_path(root.join('lib/assets/javascripts'))
    sprockets.append_path(root.join('lib/assets/stylesheets'))
    sprockets.append_path(root.join('vendor/assets/fonts'))
  end
end

require_relative 'evil-front/version'
require_relative 'evil-front/helpers'
require_relative 'evil-front/slim'
