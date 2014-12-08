module EvilFront
  # Set default options to Slim
  def self.set_slim_options!
    Slim::Engine.set_options(pretty: true, format: :html)
  end
end
