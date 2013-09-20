module MenuHelper
      
	def p_menu(id,options={},&block)    
    output = menu_encode_markup(id,options,&block)  
    output += menu_encode_script(id,options)              		                        
	end		
  
  def p_submenu(label,&block)               
    output = content_tag('li') do
      content_tag('h3', label);
    end
    output += capture(&block)
  end
  
  def p_menu_item(path,options={})   
    options = options.stringify_keys
    value = options.delete('value')
    options["data-icon"] = options['icon']    
    output = content_tag('li') do      
      link_to(value,path,options)
    end 
  end  
	
	protected
	
	def menu_encode_markup(id,options={},&block)
    clientid = sanitize_to_id(id)	
		options = options.stringify_keys   
    options = options.merge(:id => clientid)                         		     
    output = content_tag('ul', options) do
      capture(&block)
    end 
    output.html_safe			
	end
	
	def menu_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid		
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)                         
    options_ui = options_ui.to_json        
        
    script = '$(function() {'
    script += "PrimeFaces.cw('Menu','#{widgetvar}',#{options_ui})"
    script += '});'         
    p_javascript_tag(script, "id" => clientid+"_s")        		
	end
	
end