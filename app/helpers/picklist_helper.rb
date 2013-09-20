module PicklistHelper
    
	def p_picklist(id,options={},&block)    
    output = picklist_encode_markup(id,options,&block)  
    output += picklist_encode_script(id,options)              		                        
	end		
	
	protected
	
	def picklist_encode_markup(id,options={},&block)
    clientid = sanitize_to_id(id)	
		options = options.stringify_keys   
    options = options.merge(:id => clientid)                         		     
    output = content_tag('div', options) do
        capture(&block)
    end 
    output.html_safe			
	end
	
	def picklist_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid		
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)                         
    options_ui = options_ui.to_json        
        
    script = '$(function() {'
    script += "PrimeFaces.cw('Picklist','#{widgetvar}',#{options_ui})"
    script += '});'         
    p_javascript_tag(script, "id" => clientid+"_s")        		
	end
	
end