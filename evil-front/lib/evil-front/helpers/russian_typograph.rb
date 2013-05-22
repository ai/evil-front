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

    isTag     = false
    buffer    = ''
    processed = ''

    text.chars.each do |char|
      if char == '<' and not isTag
        buffer = EvilFront::Russian.typograph(buffer)
        buffer.gsub!(/\s«[^»]+»/) do |inside|
          flying_quotes inside[2..-2], space: inside[0]
        end

        processed << buffer
        buffer = char
        isTag  = true
      elsif char == '>' and isTag
        buffer    << char
        processed << buffer
        buffer = ''
        isTag  = false
      else
        buffer << char
      end
    end
    processed << (isTag ? buffer : EvilFront::Russian.typograph(buffer))

    EvilFront.html_safe(processed)
  end
end
