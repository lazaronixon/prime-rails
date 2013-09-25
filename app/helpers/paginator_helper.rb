module PaginatorHelper
    
	def p_paginator(id,options={})   
    decoded_options = paginator_decode(id,options)        
    output = paginator_encode_markup(id,decoded_options)  
    output += paginator_encode_script(id,decoded_options)              		                        
	end		
	
	protected
  
  def paginator_decode(id,options={})    
    clientid = sanitize_to_id(id)	
    param_page = params[clientid+'_page'].nil? ? 0 : (params[clientid+'_page'].to_i) -1   
    options = options.merge(:page => param_page)
    options
  end
	
	def paginator_encode_markup(id,options={})
    clientid = sanitize_to_id(id)	
		options = options.stringify_keys   
    options = options.merge(:id => clientid)                     
    output = content_tag('div',options) do
      text_field_tag(clientid+'_page',nil,type: 'hidden')
    end
    output.html_safe			
	end
	
	def paginator_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid		
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)                 
    options_ui = options_ui.to_json        
        
    script = '$(function() {'
    script += "PrimeFaces.cw('Paginator','#{widgetvar}',#{options_ui})"
    script += '});'         
    p_javascript_tag(script, "id" => clientid+"_s")        		
	end
	
end