module ActionView::Helpers::JavaScriptHelper  
  def p_javascript_tag(content_or_options_with_block = nil, html_options = {}, &block)
    content =
      if block_given?
      html_options = content_or_options_with_block if content_or_options_with_block.is_a?(Hash)
      capture(&block)
    else
      content_or_options_with_block
    end

    content_tag(:script, content.html_safe, html_options)
  end
end