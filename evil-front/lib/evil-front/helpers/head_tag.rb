# encoding: utf-8

module EvilFront::Helpers
  # Add content from `head_content` and statistics counter in production,
  # if you set `:stats` option.
  #
  #   html
  #     head
  #       = head_tag do
  #         = title_tag(t.title)
  #         = standard_assets
  #
  # You can disable statistics counter by options:
  #
  #   = head_tag(statistics: false) do
  def head_tag(options = { }, &block)
    head  = tag(:meta, charset: 'UTF-8')
    head += capture(&block) if block_given?
    head += @evil_front_head

    options[:statistics] ||= true
    if options[:statistics] and Rails.env.production?
      head += render('layouts/statistics') rescue ''
    end

    content_tag(:head, head)
  end
end
