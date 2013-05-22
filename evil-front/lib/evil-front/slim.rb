# encoding: utf-8
# Set default options to Slim

module EvilFront
  def self.set_slim_options!
    Slim::Engine.set_default_options(pretty: true, format: :html5)
  end
end
