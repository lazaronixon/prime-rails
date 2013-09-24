module SplitbuttonHelper
    
	def p_splitbutton(value,options={},&block)    
    output = splitbutton_encode_markup(value,options)  
    output += splitbutton_encode_script(options,&block)              		                        
	end		
  
	def p_splitbutton_item(value,options={})  
    options = options.stringify_keys
    output = {:text => value}           		                        
    output = output.merge(options) 
    output = output.to_json 
	end  
	
	protected
	
	def splitbutton_encode_markup(value,options={})    	
		options = options.stringify_keys                            		     
    output = button_tag(value, options)
    output.html_safe			
	end
	
	def splitbutton_encode_script(options={},&block)
    options = options.stringify_keys
    clientid = sanitize_to_id(options['id'])
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid		
    options_ui = options    
    options_ui = options_ui.merge(:items => capture(&block))
    options_ui = options_ui.to_json        
        
    script = '$(function() {'
    script += "PrimeFaces.cw('SplitButton','#{widgetvar}',#{options_ui})"
    script += '});'         
    p_javascript_tag(script, "id" => clientid+"_s")        		
	end
	
end