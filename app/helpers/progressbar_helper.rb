module ProgressbarHelper
    
	def p_progressbar(id,options={})    
    output = progressbar_encode_markup(id,options)  
    output += progressbar_encode_script(id,options)              		                        
	end	
	
	protected
	
	def progressbar_encode_markup(id,options={})
    clientid = sanitize_to_id(id)	
		options = options.stringify_keys   
    options = options.merge(:id => clientid)                         		     
    content_tag(:div,nil, options)        		
	end
	
	def progressbar_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid		
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)                         
    options_ui = options_ui.to_json        
        
    script = '$(function() {'
    script += "PrimeFaces.cw('Progressbar','#{widgetvar}',#{options_ui})"
    script += '});'         
    p_javascript_tag(script, "id" => clientid+"_s")        		
	end
	
end