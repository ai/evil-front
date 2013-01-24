# encoding: utf-8

module EvilFront::Helpers
  # Return title tag with current page title. It will just join page titles
  # from `title` helper and `site` name with `separator`.
  #
  # By default, separator will be m-dash for Russian and n-dash for others.
  #
  #   html
  #     head
  #       = title_tag('Foo Company')
  def title_tag(site = nil, separator = nil)
    @evil_front_titles ||= []
    separator ||= I18n.locale == :ru ? ' — ' : ' - '
    titles      = (@evil_front_titles + [site]).compact
    content_tag(:title, titles.join(separator))
  end
end
