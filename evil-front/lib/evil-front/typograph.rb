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

    private

    # Recursively apply typography to Nokogiri nodes
    def typograph_node!(node)
      return if node.name == 'code'

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
