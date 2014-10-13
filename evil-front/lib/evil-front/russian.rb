# encoding: utf-8

require 'unicode_utils'
# encoding: utf-8

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

    # Find quotes in text and make them flying
    def self.auto_flying_quotes(html)
      process_html(html) do |text|
        text.gsub(/\s«[^»]+»/) { |i| flying_quotes i[2..-2], space: i[0] }.
             gsub(/^«[^»]+»/)  { |i| flying_quotes i[1..-2], space: '' }
      end
    end

    # Mark quotes to move first quote before the text line.
    def self.flying_quotes(text, options = { })
      sp = options[:space] || ' '
      sp = "<span class=\"space-before-quote\">#{sp}</span>" if sp != ''
      "#{ sp }<span class=\"quotes\">«#{ text }»</span>"
    end

    private

    # Small words to insert non-break space before them
    def self.tiny_words
      @tiny_words ||= begin
        tiny  = %w(ни не и но а или да как из-за про по за для
                   на до при меж о у в во с со от ото из без
                   безо к ко об обо под подо над перед передо это)
        tiny += tiny.map { |i| capitalize_first(i) }
        tiny.map { |i| Regexp.new("( | )(#{Regexp.quote i}) ") }
      end
    end

    # Replace symbols to right ones, like m-dash, quotes, etc.
    def self.use_right_symbols(text)
      StandaloneTypograf::Typograf.new(text)
        .processor(:dashes, :quotes, :mnemonics, :fractions, :ellipsis)
        .gsub(' —', ' —')                       # nbsp before m-dash
        .gsub(/([а-яА-Я])-([а-яА-Я])/, '\1‑\2') # non-break dash
    end
  end
end
