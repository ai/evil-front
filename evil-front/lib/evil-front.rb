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
      initializer 'evil_front.action_view' do
        ActiveSupport.on_load(:action_view) { include Helpers }
      end
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
