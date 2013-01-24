# Load and initialize all helpers

module EvilFront
  module Helpers
  end

  class Railtie < Rails::Railtie
    initializer 'evil_front.action_view' do |app|
      ActiveSupport.on_load(:action_view) do
        include Helpers
      end
    end
  end
end

dir = File.join(File.dirname(__FILE__), 'helpers')
Dir.glob(File.join(dir, '*.rb')) { |helper| require helper }
