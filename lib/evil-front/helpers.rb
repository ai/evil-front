# encoding: utf-8
# Load and initialize all helpers.

module EvilFront
  module Helpers
  end
end

dir = Pathname(__FILE__).dirname.join('helpers')
Dir.glob(dir.join('*.rb').to_s) { |helper| require helper }
