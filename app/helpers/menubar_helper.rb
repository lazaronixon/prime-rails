module MenubarHelper

  def p_menubar(id,options={},&block)
    output = menubar_encode_markup(id,options,&block)
    output += menubar_encode_script(id,options)
  end

  def p_submenubar(options = {},&block)
    options = options.stringify_keys
    output = content_tag('li') do
      data_icon = {}
      data_icon["data-icon"] = options.delete('icon')
      content = content_tag('a', options['label'],data_icon);

      if block_given?
        content += content_tag('ul') do
          capture(&block)
        end
      end
    end
  end

  def p_menubar_item(path,options={})
    options = options.stringify_keys
    value = options.delete('value')
    options["data-icon"] = options['icon']
    output = content_tag('li') do
      link_to(value,path,options)
    end
  end

  protected

  def menubar_encode_markup(id,options={},&block)
    clientid = sanitize_to_id(id)
    options = options.stringify_keys
    options = options.merge(:id => clientid)
    output = content_tag('ul', options) do
      capture(&block)
    end
    output.html_safe
  end

  def menubar_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)
    options_ui = options_ui.to_json

    script = '$(function() {'
      script += "PrimeFaces.cw('Menubar','#{widgetvar}',#{options_ui})"
    script += '});'
    p_javascript_tag(script, "id" => clientid+"_s")
  end

end