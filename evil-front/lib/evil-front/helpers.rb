module EvilFront
  HTML_ESCAPE = { '&' => '&amp;',  '>' => '&gt;', '<' => '&lt;' }

  # Call `html_safe` if String has this methods.
  def self.html_safe(string)
    if string.respond_to?(:html_safe)
      string.html_safe
    else
      string.to_s
    end
  end

  # Escape unsafe strings
  def self.escape(string)
    string = string.to_s
    if not string.respond_to?(:html_safe?) or string.html_safe?
      string
    else
      string.gsub(/[&><]/, HTML_ESCAPE).html_safe
    end
  end
end

dir = Pathname(__FILE__).dirname.join('helpers')
Dir.glob(dir.join('*.rb').to_s) { |helper| require helper }
