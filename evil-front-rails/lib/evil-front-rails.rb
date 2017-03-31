require 'evil-front-all'

require 'sass-rails'
require 'slim-rails'

module EvilFront
  class Railtie < ::Rails::Railtie
    initializer 'evil_front.config' do |app|
      # Disable assets and helper per controller
      app.config.generators.stylesheets = false
      app.config.generators.javascripts = false
      app.config.generators.helper      = false

      # Precompile all JS/CSS in root of app assets dirs.
      app.config.assets.precompile +=
        Dir[::Rails.root.join('app/assets/*/*.{js,css,coffee,sass,scss}*')].
        map { |i| File.basename(i).sub(/(\.js)?\.coffee$/, '.js') }.
        map { |i| File.basename(i).sub(/(\.css)?\.(sass|scss)$/, '.css') }.
        reject { |i| i =~ /^application\.(js|css)$/ }

      # Sass debug in Chrome
      if ::Rails.env.development?
        app.config.sass.debug_info = true
      end
    end
  end
end

require_relative 'evil-front/rails/version'
