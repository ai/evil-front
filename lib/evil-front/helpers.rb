# encoding: utf-8
# Load and initialize all helpers.

module EvilFront
  module Helpers
  end
end

dir = File.join(File.dirname(__FILE__), 'helpers')
Dir.glob(File.join(dir, '*.rb')) { |helper| require helper }
