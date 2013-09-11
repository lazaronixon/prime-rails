module FieldsetHelper
    
	def p_fieldset(id,options={},&block)    
        output = fieldset_encodeMarkup(id,options,&block)  
        output += fieldset_encodeScript(id,options)              		                        
	end		
	
	protected
	
	def fieldset_encodeMarkup(id,options={},&block)
        clientId = sanitize_to_id(id)	
		options = options.stringify_keys   
        options = options.merge(:id => clientId)                         		     
        output = content_tag('fieldset', options) do
            content_tag('legend',options['legend']) +
        	capture(&block)
        end 
        output.html_safe			
	end
	
	def fieldset_encodeScript(id,options={})
	    options = options.stringify_keys
        clientId = sanitize_to_id(id)
        widgetVar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientId		
        options_ui = options
        options_ui = options_ui.merge(:id => clientId)                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('Fieldset','#{widgetVar}',#{options_ui})"
        script += '});'         
        javascript_tag(script, "id" => clientId+"_s")        		
	end
	
end