module DialogHelper
    
	def p_dialog(id,options={},&block)    
        output = dialog_encodeMarkup(id,options,&block)  
        output += dialog_encodeScript(id,options)              		                        
	end	
	
	protected
	
	def dialog_encodeMarkup(id,options={},&block)
        clientId = sanitize_to_id(id)	
		options = options.stringify_keys   
        options = options.merge(:id => clientId)                         		     
        output = content_tag(:div, options) do
        	capture(&block)
        end 
        output.html_safe			
	end
	
	def dialog_encodeScript(id,options={})
	    options = options.stringify_keys
        clientId = sanitize_to_id(id)
        widgetVar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientId		
        options_ui = options
        options_ui = options_ui.merge(:id => clientId)                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('Dialog','#{widgetVar}',#{options_ui})"
        script += '});'         
        javascript_tag(script, "id" => clientId+"_s")        		
	end
	
end