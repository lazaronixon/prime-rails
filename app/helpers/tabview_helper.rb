module TabviewHelper
    
	def p_tabview(id,options={})    
        output = tabview_encodeMarkup(id,options)  
        output += tabview_encodeScript(id,options)              		                        
	end
	
	def p_tab(id,options={},&block)
		options = options.stringify_keys
		forId = sanitize_to_id(options["for"])
        clientId = forId+":"+sanitize_to_id(id)		
		content_for(("tab_header_" + forId)) do
			content_tag(:li, nil) do
				title = options["title"]
				output = content_tag(:a, title, href: clientId)
				output += content_tag(:span, nil, class: "ui-icon ui-icon-close") if options["closable"]				    	
				output
			end	
		end		
		
		content_for(("tab_content_" + forId)) do
			content_tag(:div, nil, id: clientId) do
				capture(&block)	    	
			end	
		end		    	    
	end	
	
	private
	
	def tabview_encodeMarkup(id,options={})
        clientId = sanitize_to_id(id)	
        output = content_tag(:div, nil,id: clientId) do
        			content_tag(:ul, nil) do
        				content_for("tab_header_"+clientId)
        			end +
        			content_tag(:div, content_for("tab_content_"+clientId))
        		 end        		 
        output.html_safe			
	end
	
	def tabview_encodeScript(id,options={})
        clientId = sanitize_to_id(id)
        widgetVar = options["var"] ? options["var"] : "widget_"+clientId		
        options_ui = options
        options_ui = options_ui.merge(:id => clientId )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('TabView','#{widgetVar}',#{options_ui})"
        script += '});'         
        javascript_tag(script, "id" => clientId+"_s")        		
	end
	
end