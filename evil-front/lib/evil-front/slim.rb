module EvilFront
  # Set default options to Slim
  def self.set_slim_options!
    Slim::Engine.set_default_options(pretty: true, format: :html5)
  end
end
