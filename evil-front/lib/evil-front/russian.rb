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
      return text if text.nil? or text.empty?

      typograf = StandaloneTypograf::Typograf.new(text)
      typograf.dasherize
      typograf.signs
      typograf.quotes
      typograf.dots
      text = typograf.endash

      tiny = %w(ни не и но а или да как из-за про по за для
                на до при меж о у в во с со от ото из без
                безо к ко об обо под подо над перед передо)
      tiny += tiny.map { |i| capitalize_first(i) }
      tiny.each do |word|
        regexp = Regexp.new(" #{Regexp.quote word} ") # fix JRuby issue
        text.gsub! regexp, " #{word} " # non-break space
      end

      text.gsub!(/([\s ])([^\s" ]+-[^\s" ]+)([\s \.,])/, '\1<nobr>\2</nobr>\3')

      text
    end

    # Like `typograph`, but process only text nodes in HTML.
    #
    #   EvilFront::Russian.typograph_html(article.html)
    def self.typograph_html(html)
      return html if html.nil? or html.empty?

      html.split('<').map { |text|
        tag, text = text.split('>', 2)

        if text
          text = typograph(text)
          text.gsub!(/\s«[^»]+»/) { |i| flying_quotes i[2..-2], space: i[0] }
          [tag, text].join('>')
        else
          [tag].join('>')
        end
      }.join('<')
    end

    # Mark quotes to move first quote before the text line.
    def self.flying_quotes(text, options = { })
      space = options[:space] || ' '
      '<span class="space-before-quote">' + space + '</span>' +
      '<span class="quotes">«' + text + '»</span>'
    end
  end
end
