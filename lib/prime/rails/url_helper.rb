module ActionView::Helpers::UrlHelper
  def p_button_to(name = nil, options = nil, html_options = nil, &block)
    html_options, options = options, name if block_given?
    options      ||= {}
    html_options ||= {}

    html_options = html_options.stringify_keys
    convert_boolean_attributes!(html_options, %w(disabled))

    url    = options.is_a?(String) ? options : url_for(options)
    remote = html_options.delete('remote')

    method     = html_options.delete('method').to_s
    method_tag = %w{patch put delete}.include?(method) ? method_tag(method) : ''.html_safe

    form_method  = method == 'get' ? 'get' : 'post'
    form_options = html_options.delete('form') || {}
    form_options[:class] ||= html_options.delete('form_class') || 'button_to'
    form_options.merge!(method: form_method, action: url)
    form_options.merge!("data-remote" => "true") if remote

    request_token_tag = form_method == 'post' ? token_tag : ''

    html_options = convert_options_to_data_attributes(options, html_options)
    html_options['type'] = 'submit'

    button = if block_given?
      content_tag('button', html_options, &block)
    else
      html_options['value'] = name || url
      content_tag('button', html_options) do
        html_options['value']
      end
    end

    output = button

    options = html_options.stringify_keys

    clientid = sanitize_to_id(options["id"])
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid

    options_ui = options
    options_ui = options_ui.merge(:id => clientid )
    options_ui = options_ui.to_json

    script = '$(function() {'
      script += "PrimeFaces.cw('Button','#{widgetvar}',#{options_ui})"
    script += '});'
    output += p_javascript_tag(script, "id" => clientid+"_s")

    button = output

    inner_tags = method_tag.safe_concat(button).safe_concat(request_token_tag)
    content_tag('form', content_tag('div', inner_tags), form_options)
  end
end