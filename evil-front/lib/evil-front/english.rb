# encoding: utf-8

require 'rubypants-unicode'

module EvilFront
  # Helpers to work with English text.
  module English
    extend Typograph

    # Insert non-break spaces and mark quotes to have nice text.
    # Work only with English language.
    #
    #   EvilFront::English.typograph(article)
    def self.typograph(text)
      return text if text.nil? or text.empty?

      text = RubyPants.new(text).to_html

      tiny = %w(to is be the a an no if at on of in or and)
      tiny += tiny.map { |i| i.capitalize }
      tiny.each do |word|
        regexp = Regexp.new("( | )#{Regexp.quote word} ") # fix JRuby issue
        text.gsub! regexp, "\\1#{word} " # non-break space
      end

      text.gsub!(/([^\s" ]+)-([^\s" ]+)/, '\1‑\2')

      text
    end

    private

    # Apply all typograph methods to text
    def self.typograph_all(text)
      typograph(text)
    end
  end
end
