module AutocompleteHelper

  def p_autocomplete(name, value = nil, options = {})
    output = autocomplete_encode_markup(name, value, options)
    output += autocomplete_encode_script(name, value, options)
  end

  protected

  def autocomplete_encode_markup(name, value = nil, options = {})
    options = options.stringify_keys
    clientid = sanitize_to_id(name)
    options.delete('completeSource')
    options.delete('content')
    output = tag :input, { "type" => "text", "name" => name, "id" => clientid, "value" => value }.update(options.stringify_keys)
    output.html_safe
  end

  def autocomplete_encode_script(name, value = nil, options = {})
    options = options.stringify_keys
    clientid = sanitize_to_id(name)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)
    options_ui = options_ui.to_json

    script = '$(function() {'
      script += "PrimeFaces.cw('Autocomplete','#{widgetvar}',#{options_ui})"
    script += '});'
    p_javascript_tag(script, "id" => clientid+"_s")
  end

end