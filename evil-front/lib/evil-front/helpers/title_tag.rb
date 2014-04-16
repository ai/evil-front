# encoding: utf-8

require 'i18n'

module EvilFront::Helpers
  # Return title tag with current page title. It will just join page titles
  # from `title` helper and `site` name.
  #
  # By default, separator will be m-dash for Russian and n-dash for others.
  #
  #   html
  #     head
  #       = title_tag('Foo Company')
  #
  # Separator will be taken by current locale. But, you can change it by
  # `separator` option:
  #
  #   = title_tag('Foo Company', separator: ' * ')
  def title_tag(*site)
    options   = site.extract_options!
    separator = options[:separator] || (I18n.locale == :ru ? ' — ' : ' - ')

    site = [] if @evil_front_no_site_in_title

    @evil_front_titles ||= []
    titles = (@evil_front_titles + site).compact
    titles = titles.join(separator)
    EvilFront.html_safe("<title>#{ EvilFront.escape(titles) }</title>")
  end
end
