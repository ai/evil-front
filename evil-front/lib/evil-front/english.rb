# encoding: utf-8

require 'rubypants-unicode'

module EvilFront
  # Helpers to work with English text.
  module English
    extend Typograph

    private

    # Replace symbols to right ones, like m-dash, quotes, etc.
    def self.use_right_symbols(text)
      RubyPants.new(text).to_html
    end

    # Small words to insert non-break space before them
    def self.tiny_words
      @tiny_words ||= begin
        tiny  = %w(to is be the a an no if at on of in or and)
        tiny += tiny.map(&:capitalize)
        tiny.map { |i| Regexp.new("( | )(#{Regexp.quote i}) ") }
      end
    end
  end
end
