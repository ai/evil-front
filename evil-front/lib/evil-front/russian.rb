# encoding: utf-8

require 'unicode_utils'
require 'standalone_typograf'

module EvilFront
  # Helpers to work with Russian text.
  module Russian
    extend Typograph

    # Capitalize only first letter (like titles in Russian).
    #
    #   = EvilFront::Russian.capitalize_first(title)
    def self.capitalize_first(text)
      UnicodeUtils.upcase(text[0]) + text[1..-1]
    end

    # Insert non-break spaces and mark quotes to have nice text.
    # Work only with Russian language.
    #
    #   EvilFront::Russian.typograph(article)
    def self.typograph(text)
      return text if text.nil? or text.empty?

      text = StandaloneTypograf::Typograf.new(text).prepare

      tiny = %w(ни не и но а или да как из-за про по за для
                на до при меж о у в во с со от ото из без
                безо к ко об обо под подо над перед передо)
      tiny += tiny.map { |i| capitalize_first(i) }
      tiny.each do |word|
        regexp = Regexp.new("( | )#{Regexp.quote word} ") # fix JRuby issue
        text.gsub! regexp, "\\1#{word} " # non-break space
      end

      text.gsub!(/([^\s" ]+)-([^\s" ]+)/, '\1‑\2')

      text
    end

    # Find quotes in text and make them flying
    def self.auto_flying_quotes(text)
      text.gsub(/\s«[^»]+»/) { |i| flying_quotes i[2..-2], space: i[0] }.
           gsub(/^«[^»]+»/)  { |i| flying_quotes i[1..-2], space: '' }
    end

    # Mark quotes to move first quote before the text line.
    def self.flying_quotes(text, options = { })
      sp = options[:space] || ' '
      sp = "<span class=\"space-before-quote\">#{sp}</span>" if sp != ''
      "#{ sp }<span class=\"quotes\">«#{ text }»</span>"
    end

    private

    # Apply all typograph methods to text
    def self.typograph_all(text)
      auto_flying_quotes(typograph(text))
    end
  end
end
