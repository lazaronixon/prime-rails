module BreadcrumbHelper
  
  def render_breadcrumbs(&block)
    content = render :partial => 'prime-rails/breadcrumbs', :layout => false
    if block_given?
      capture(content, &block)
    else
      content
    end
  end
  
	def p_breadcrumb(id,options={},&block)    
    output = breadcrumb_encode_markup(id,options,&block)  
    output += breadcrumb_encode_script(id,options)              		                        
	end	  
  
	def p_breadcrumb_menu(id,options={})
    options = options.stringify_keys       
    output = content_tag(:li, options) do
      content_tag(:a, options['value'], href: options['url'])
    end            		                        
	end	   
  
  
  protected
  
	def breadcrumb_encode_markup(id,options={},&block)
    clientid = sanitize_to_id(id)	
		options = options.stringify_keys   
    options = options.merge(:id => clientid)                         		     
    output = content_tag(:ul, options) do
      capture(&block)
    end 
    output.html_safe			
	end
	
	def breadcrumb_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid		
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)                         
    options_ui = options_ui.to_json        
        
    script = '$(function() {'
    script += "PrimeFaces.cw('Breadcrumb','#{widgetvar}',#{options_ui})"
    script += '});'         
    javascript_tag(script, "id" => clientid+"_s")        		
	end  
  
end
