# encoding: utf-8

require 'nokogiri'

module EvilFront
  # Abstract module to be used in `Russian` and `English` typographs.
  module Typograph
    # Like `typograph`, but process only text nodes in HTML.
    #
    #   EvilFront::Russian.typograph_html(article.html)
    def typograph_html(html)
      return html if html.nil? or html.empty?

      if html.include? '<'
        nodes = Nokogiri::HTML::DocumentFragment.parse(html)
        typograph_node! nodes
        nodes.to_html
      else
        typograph_all(html)
      end
    end

    # Insert non-break spaces and mark quotes to have nice text.
    #
    #   EvilFront::Russian.typograph(article)
    def typograph(text)
      return text if text.nil? or text.empty?

      text.gsub! '&quot;', '"'
      text = use_right_symbols(text)
      text.gsub!(/([^\s" ]+)-([^\s" ]+)/, '\1‑\2')
      tiny_words.each { |regexp| text.gsub! regexp, "\\1\\2 " }

      text
    end

    private

    # Recursively apply typography to Nokogiri nodes
    def typograph_node!(node)
      return if %w(pre code kbd script style math).include? node.name

      node.children.each do |child|
        if child.is_a? Nokogiri::XML::Text
          text = EvilFront.escape(child.content)
          child.replace( typograph_all(text) )
        else
          typograph_node! child
        end
      end
    end
  end
end
