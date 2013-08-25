# encoding: utf-8
# Load and initialize all helpers.

module EvilFront
  # Call `html_safe` if String has this methods.
  def self.html_safe(string)
    if string.respond_to?(:html_safe)
      string.html_safe
    else
      string.to_s
    end
  end

  module Helpers
    include JqueryCdn::Helpers unless defined? ::Rails
  end
end

dir = Pathname(__FILE__).dirname.join('helpers')
Dir.glob(dir.join('*.rb').to_s) { |helper| require helper }
