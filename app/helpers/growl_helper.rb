module GrowlHelper  
  ALERT_TYPES = [:error, :info, :warn]
    
	def p_growl(id,options={})    
    output = growl_encode_markup(id,options)  
    output += growl_encode_script(id,options)              		                        
	end	
	
	protected
	
	def growl_encode_markup(id,options={})
    clientid = sanitize_to_id(id)	
		options = options.stringify_keys   
    options = options.merge(:id => clientid)         
    content_tag(:div,nil, options)        		
	end
	
	def growl_encode_script(id,options={})
    options = options.stringify_keys
    clientid = sanitize_to_id(id)
    widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid		    
    
    mens = []
    flash.each do |type, message| 
      next if message.blank?      
      type = :info if type == :info
      type = :warn if type == :warning            
      type = :error if type == :error  
            
      summ = options['info_title'] if type == :info
      summ = options['warn_title'] if type == :warn            
      summ = options['error_title'] if type == :error        
      summ = '' if summ.nil?
      next unless ALERT_TYPES.include?(type)  
                   
      mens = mens +  [severity: type, summary: summ, detail: message]
    end       
    
    options = options.merge(:messages => mens)
    options_ui = options
    options_ui = options_ui.merge(:id => clientid)                
    options_ui = options_ui.to_json        
        
    script = '$(function() {'
    script += "PrimeFaces.cw('Growl','#{widgetvar}',#{options_ui})"
    script += '});'         
    javascript_tag(script, "id" => clientid+"_s")        		
	end
	
end