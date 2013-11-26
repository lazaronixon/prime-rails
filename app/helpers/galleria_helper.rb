module GalleriaHelper

  def p_galleria(id,options={},&block)
    output = galleria_encode_markup(id,options,&block)
    output += galleria_encode_script(id,options)
  end

  def p_galleria_item(options={},&block)
    options = options.stringify_keys
    output = content_tag('li') do
      src = options.delete('src')
      if block_given?
        image_tag(src,options) +
        content_tag('div', capture(&block))
      else
        image_tag(src,options)
      end
    end
  end

  protected

  def galleria_encode_markup(id,options={},&block)
    clientid = sanitize_to_id(id)
    options = options.stringify_keys
    options = options.merge(:id => clientid)
    output = content_tag('div', options) do
      content_tag('ul') do
        capture(&block)
      end
    end
    output.html_safe
  end

  def galleria_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)
    options_ui = options_ui.to_json

    script = '$(function() {'
      script += "PrimeFaces.cw('Galleria','#{widgetvar}',#{options_ui})"
    script += '});'
    p_javascript_tag(script, "id" => clientid+"_s")
  end

end