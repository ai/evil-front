# encoding: utf-8

module EvilFront::Helpers
  # Insert non-break spaces and mark quotes to have nice text. Work only with
  # Russian language.
  #
  #   = typograph user.description
  #
  # You can send block:
  #
  #   = typograph do
  #     = user.name
  #     = user.profession
  def russian_typograph(text = nil, &block)
    text = capture(&block) if block_given?
    text = raw(text)

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
      text.gsub! " #{word} ", " #{word} " # non-break space
    end

    text.gsub!(/([\s ])([^\s" ]+-[^\s" ]+)([\s \.,])/, '\1<nobr>\2</nobr>\3')

    text.gsub!(/\s«[^»]+»/) do |inside|
      flying_quotes inside[2..-2], space: inside[0]
    end

    text.html_safe
  end
end
