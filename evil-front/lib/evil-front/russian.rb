# encoding: utf-8

require 'unicode_utils'
require 'nokogiri'
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

      if html.include? '<'
        nodes = Nokogiri::HTML::DocumentFragment.parse(html)
        typograph_node! nodes
        nodes.to_html
      else
        auto_flying_quotes(typograph(html))
      end
    end

    # Find quotes in text and make them flying
    def self.auto_flying_quotes(text)
      text.gsub(/\s?«[^»]+»/) do |i|
        if i[0] == '«'
          flying_quotes i[1..-2], space: ''
        else
          flying_quotes i[2..-2], space: i[0]
        end
      end
    end

    # Mark quotes to move first quote before the text line.
    def self.flying_quotes(text, options = { })
      space = options[:space] || ' '
      (space == '' ? '' : "<span class='space-before-quote'>#{space}</span>") +
      '<span class="quotes">«' + text + '»</span>'
    end

    private

    # Recursively pply typography to Nokogiri nodes
    def self.typograph_node!(node)
      if node.is_a? Nokogiri::XML::Text
        node.content = auto_flying_quotes(typograph(node.content))
      elsif node.respond_to? :children
        node.children.each { |child| typograph_node!(child) }
      end
    end
  end
end
