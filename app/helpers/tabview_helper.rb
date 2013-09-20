module TabviewHelper
    
	def p_tabview(id,options={})    
        output = tabview_encode_markup(id,options)  
        output += tabview_encode_script(id,options)              		                        
	end
	
	def p_tab(id,options={},&block)
		options = options.stringify_keys
		forid = sanitize_to_id(options["for"])
        clientid = forid+":"+sanitize_to_id(id)		
		content_for(("tab_header_" + forid)) do
			content_tag(:li, nil) do
				title = options["title"]
				output = content_tag(:a, title, href: clientid)
				output += content_tag(:span, nil, class: "ui-icon ui-icon-close") if options["closable"]				    	
				output
			end	
		end		
		
		content_for(("tab_content_" + forid)) do
			content_tag(:div, nil, id: clientid) do
				capture(&block)	    	
			end	
		end		    	    
	end	
	
	private
	
	def tabview_encode_markup(id,options={})
        clientid = sanitize_to_id(id)	
        output = content_tag(:div, nil,id: clientid) do
        			content_tag(:ul, nil) do
        				content_for("tab_header_"+clientid)
        			end +
        			content_tag(:div, content_for("tab_content_"+clientid))
        		 end        		 
        output.html_safe			
	end
	
	def tabview_encode_script(id,options={})
        clientid = sanitize_to_id(id)
        widgetvar = options["widgetVar"] ? options["widgetVar"] : "widget_"+clientid		
        options_ui = options
        options_ui = options_ui.merge(:id => clientid )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('TabView','#{widgetvar}',#{options_ui})"
        script += '});'         
        p_javascript_tag(script, "id" => clientid+"_s")        		
	end
	
end