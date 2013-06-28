# encoding: utf-8
# Load all neccessary libraries and files.

require 'pathname'

require 'sass'
require 'slim'
require 'uglifier'
require 'sprockets'
require 'csso-rails'
require 'coffee_script'
require 'rails-sass-images'
require 'evil-blocks-rails'
require 'autoprefixer-rails'

module EvilFront
  autoload :Russian, 'evil-front/russian'

  if defined?(::Rails)
    # Enable `lib/assets/` and `vendor/assets/` in Rails app.
    class Engine < ::Rails::Engine
    end
  end

  # Install Evil Front to standalone Sprockets environment.
  def self.install(sprockets)
    root = Pathname(__FILE__).dirname.join('..')
    sprockets.append_path(root.join('lib/assets/javascripts'))
    sprockets.append_path(root.join('lib/assets/stylesheets'))
    sprockets.append_path(root.join('vendor/assets/fonts'))
  end

  # Install Evil Front, Autoprefixer, Rails Sass Images nd Csso to Sprockets.
  def self.install_all(sprockets)
    AutoprefixerRails.install(sprockets)
    RailsSassImages.install(sprockets)
    EvilBlocks.install(sprockets)
    Csso.install(sprockets)
    install(sprockets)
  end
end

dir = Pathname(__FILE__).dirname.join('evil-front')
require dir.join('version')
require dir.join('helpers')
require dir.join('slim')
