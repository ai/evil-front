# encoding: utf-8

require 'nokogiri'

module EvilFront
  # Abstract module to be used in `Russian` and `English` typographs.
  module Typograph
    # Like `typograph`, but process only text nodes in HTML.
    #
    #   EvilFront::Russian.typograph_html(article.html)
    def typograph_html(html)
      process_html(html) { |text| typograph(text) }
    end

    # Insert non-break spaces and mark quotes to have nice text.
    #
    #   EvilFront::Russian.typograph(article)
    def typograph(text)
      return text if text.nil? or text.empty?

      text.gsub! '&quot;', '"'
      text = use_right_symbols(text)
      tiny_words.each { |regexp| text.gsub! regexp, "\\1\\2 " }

      text
    end

    private

    # Parse HTML and run block only on texts
    def process_html(html, &block)
      return html if html.nil? or html.empty?

      if html.include? '<'
        nodes = Nokogiri::HTML::DocumentFragment.parse(html, 'utf-8')
        process_node!(nodes, &block)
        nodes.to_html
      else
        yield(html)
      end
    end

    # Run block on every text node recursively
    def process_node!(node, &block)
      return if %w(pre code kbd script style math).include? node.name

      node.children.each do |child|
        if child.is_a? Nokogiri::XML::Text
          text = EvilFront.escape(child.content)
          child.replace( yield(text) )
        else
          process_node! child, &block
        end
      end
    end
  end
end
