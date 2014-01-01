# encoding: utf-8
# Load all neccessary libraries and files.

require 'evil-front-core'

require 'uglifier'
require 'csso-rails'
require 'jquery-cdn'
require 'coffee_script'
require 'evil-blocks-rails'
require 'autoprefixer-rails'

module EvilFront
  # Install Evil Front, Autoprefixer, Evil Blocks, Rails Sass Images
  # and Csso to Sprockets.
  def self.install_all(sprockets, options = {})
    AutoprefixerRails.install(sprockets, options[:browsers])
    EvilBlocks.install(sprockets)
    JqueryCdn.install(sprockets)
    Csso.install(sprockets)
    install(sprockets)

    EvilFront.set_slim_options!
  end

  unless defined? ::Rails
    module Helpers
      include JqueryCdn::Helpers
    end
  end
end
