require 'evil-front'

require 'uglifier'
require 'jquery-cdn'
require 'coffee_script'
require 'evil-blocks-rails'
require 'autoprefixer-rails'

module EvilFront
  # Install Evil Front, Autoprefixer, Evil Blocks, Rails Sass Images
  # and Csso to Sprockets.
  def self.install_all(sprockets, options = {})
    autoprefixer = { }
    autoprefixer[:browsers] = options[:browsers] if options.has_key? :browsers

    AutoprefixerRails.install(sprockets, autoprefixer)
    EvilBlocks.install(sprockets)
    JqueryCdn.install(sprockets)
    install(sprockets)

    EvilFront.set_slim_options!
  end

  unless defined? ::Rails
    module Helpers
      include JqueryCdn::Helpers
    end
  end
end

require_relative 'evil-front/all/version'
