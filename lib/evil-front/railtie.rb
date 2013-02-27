# encoding: utf-8
# Integrate with Rails and set defaults for Rails application config.

module EvilFront
  class Railtie < Rails::Railtie
    initializer 'evil_front.config' do |app|
      # Disable assets and helper per controller
      app.config.generators.stylesheets = false
      app.config.generators.javascripts = false
      app.config.generators.helper      = false

      # Precompile all JS/CSS in root of app assets dirs.
      app.config.assets.precompile +=
        Dir[Rails.root.join('app/assets/*/*.{js,css,coffee,sass,scss}*')].
        map { |i| File.basename(i).sub(/(\.js)?\.coffee$/, '.js') }.
        map { |i| File.basename(i).sub(/(\.css)?\.(sass|scss)$/, '.css') }.
        reject { |i| i =~ /^application\.(js|css)$/ } +
        ['jquery.js']

      # Sass debug in Chrome
      if Rails.env.development?
        app.config.sass.debug_info = true
      end
    end

    initializer 'evil_front.action_view' do
      ActiveSupport.on_load(:action_view) { include Helpers }
    end
  end

  # Enable `lib/assets/` and `vendor/assets/`.
  class Engine < ::Rails::Engine
  end
end
