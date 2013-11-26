module PanelHelper

  def p_panel(id,options={},&block)
    output = panel_encode_markup(id,options,&block)
    output += panel_encode_script(id,options)
  end

  protected

  def panel_encode_markup(id,options={},&block)
    clientid = sanitize_to_id(id)
    options = options.stringify_keys
    options = options.merge(:id => clientid)
    output = content_tag('div', options) do
      content_tag('title',options['title']) +
      capture(&block)
    end
    output.html_safe
  end

  def panel_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)
    options_ui = options_ui.to_json

    script = '$(function() {'
      script += "PrimeFaces.cw('Panel','#{widgetvar}',#{options_ui})"
    script += '});'
    p_javascript_tag(script, "id" => clientid+"_s")
  end

end