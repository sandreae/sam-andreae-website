
require 'liquid'

module TargetAnchor 
  def open_in_new_window(input, url)
    return '<a href="' << url << '" target="_blank">' << input << '</a>'
  end
end

Liquid::Template.register_filter(TargetAnchor)