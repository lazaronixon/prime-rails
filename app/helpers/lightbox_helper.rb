module LightboxHelper

  def p_lightbox(id,options={},&block)
    output = lightbox_encode_markup(id,options,&block)
    output += lightbox_encode_script(id,options)
  end

  protected

  def lightbox_encode_markup(id,options={},&block)
    clientid = sanitize_to_id(id)
    options = options.stringify_keys
    options = options.merge(:id => clientid)

    if (options['iframe'])
      output = content_tag('a', options) do
        capture(&block)
      end
    else
      output = content_tag('div', options) do
        capture(&block)
      end
    end
    output.html_safe
  end

  def lightbox_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)
    options_ui = options_ui.to_json

    script = '$(function() {'
      script += "PrimeFaces.cw('Lightbox','#{widgetvar}',#{options_ui})"
    script += '});'
    p_javascript_tag(script, "id" => clientid+"_s")
  end

end