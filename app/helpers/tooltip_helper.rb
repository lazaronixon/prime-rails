module TooltipHelper
    
	def p_tooltip(id,options={},&block) 
    output = tooltip_encode_markup(id,options)  
    output += tooltip_encode_script(id,options,&block)       
  end	
	
	protected	
	
	def tooltip_encode_markup(id,options={})
    clientid = sanitize_to_id(id)	
		options = options.stringify_keys   
    options = options.merge(:id => clientid)    
    content_tag(:div,nil, options)        		
	end
	
	def tooltip_encode_script(id,options={},&block)
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid		
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)    
    if block_given?       
      content_block = capture(&block)               
      options_ui = options_ui.merge(:content => content_block)
    end    
    options_ui = options_ui.to_json        
        
    script = '$(function() {'
    script += "PrimeFaces.cw('Tooltip','#{widgetvar}',#{options_ui})"
    script += '});'         
    javascript_tag(script, "id" => clientid+"_s")        		
	end
	
end