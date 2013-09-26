module DatatableHelper
    
	def p_datatable(id,options={}) 
    decoded_options = datatable_decode(id,options)        
    output = datatable_encode_markup(id,decoded_options)  
    output += datatable_encode_script(id,decoded_options)              		                        
	end		
	
	protected
  
  def datatable_decode(id,options={})    
    clientid = sanitize_to_id(id)	  
    param_selection = params[clientid+'_selection']      
    options = options.merge(:selection => param_selection)
    options
  end  
	
	def datatable_encode_markup(id,options={})
    clientid = sanitize_to_id(id)	
		options = options.stringify_keys   
    options = options.merge(:id => clientid)  
    options.delete('columns')    
    options.delete('datasource')
    output = content_tag('div', options) do
      text_field_tag(clientid+'_selection',options['selection'],type: 'hidden')
    end
    output.html_safe			
	end
	
	def datatable_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid		
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)                         
    options_ui = options_ui.to_json        
        
    script = '$(function() {'
    script += "PrimeFaces.cw('DataTable','#{widgetvar}',#{options_ui})"
    script += '});'         
    p_javascript_tag(script, "id" => clientid+"_s")        		
	end
	
end