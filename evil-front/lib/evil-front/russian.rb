# encoding: utf-8

require 'unicode_utils'
require 'standalone_typograf'

module EvilFront
  # Helpers to work with Russian text.
  module Russian
    # Capitalize only first letter (like titles in Russian).
    #
    #   = EvilFront::Russian.capitalize_first(title)
    def self.capitalize_first(text)
      UnicodeUtils.upcase(text[0]) + text[1..-1]
    end

    # Insert non-break spaces and mark quotes to have nice text. Work only with
    # Russian language.
    #
    #   EvilFront::Russian.typograph(article)
    def self.typograph(text)
      typograf = StandaloneTypograf::Typograf.new(text)
      typograf.dasherize
      typograf.signs
      typograf.quotes
      typograf.dots
      text = typograf.endash

      tiny  = %w(ни не и но а или да как из-за про по за для на до при меж о у в
                 во с со от ото из без безо к ко об обо под подо над перед передо)
      tiny += tiny.map { |i| capitalize_first(i) }
      tiny.each do |word|
        regexp = Regexp.new(" #{Regexp.quote word} ") # fix JRuby issue
        text.gsub! regexp, " #{word} " # non-break space
      end

      text.gsub!(/([\s ])([^\s" ]+-[^\s" ]+)([\s \.,])/, '\1<nobr>\2</nobr>\3')

      text
    end
  end
end
