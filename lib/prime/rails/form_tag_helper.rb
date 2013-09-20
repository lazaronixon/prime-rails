module ActionView::Helpers::FormTagHelper
      def p_text_field_tag(name, value = nil, options = {})
        options = options.stringify_keys
        clientid = sanitize_to_id(name)
        widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid
        output = tag :input, { "type" => "text", "name" => name, "id" => sanitize_to_id(name), "value" => value }.update(options.stringify_keys)

        widgetclass = "InputText"
        widgetclass = "Password" if options['type'] == 'password'
        
        options_ui = options
        options_ui = options_ui.merge(:id => clientid )                         
        options_ui = options_ui.to_json            
        
        script = '$(function() {'
        script += "PrimeFaces.cw('#{widgetclass}','#{widgetvar}',#{options_ui})"
        script += '});'         
        output += p_javascript_tag(script, "id" => clientid+"_s")
                       
      end                         
      
      def p_text_area_tag(name, content = nil, options = {})        
        options = options.stringify_keys
        clientid = sanitize_to_id(name)
        widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid        

        if size = options.delete("size")
          options["cols"], options["rows"] = size.split("x") if size.respond_to?(:split)
        end

        escape = options.delete("escape") { true }
        content = ERB::Util.html_escape(content) if escape        

        output = content_tag :textarea, content.to_s.html_safe, { "name" => name, "id" => sanitize_to_id(name) }.update(options)                
        
        options_ui = options
        options_ui = options_ui.merge(:id => clientid )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('InputTextarea','#{widgetvar}',#{options_ui})"
        script += '});'         
        output += p_javascript_tag(script, "id" => clientid+"_s")        
      end                          
      
      def p_check_box_tag(name, value = "1", checked = false, options = {})
        html_options = { "type" => "checkbox", "name" => name, "id" => sanitize_to_id(name), "value" => value }.update(options.stringify_keys)
        html_options["checked"] = "checked" if checked
        output = tag :input, html_options
        
        clientid = sanitize_to_id(name)
        widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid         
        
        options_ui = options
        options_ui = options_ui.merge(:id => clientid )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('CheckBox','#{widgetvar}',#{options_ui})"
        script += '});'         
        output += p_javascript_tag(script, "id" => clientid+"_s")         
        
      end   
      
      def p_password_field_tag(name = "password", value = nil, options = {})
        p_text_field_tag(name, value, options.update("type" => "password"))
      end    
      
      def p_select_tag(name, option_tags = nil, options = {})
        option_tags ||= ""
        html_name = (options[:multiple] == true && !name.to_s.ends_with?("[]")) ? "#{name}[]" : name

        if options.delete(:include_blank)
          option_tags = content_tag(:option, '', :value => '').safe_concat(option_tags)
        end

        if prompt = options.delete(:prompt)
          option_tags = content_tag(:option, prompt, :value => '').safe_concat(option_tags)
        end

        output = content_tag :select, option_tags, { "name" => html_name, "id" => sanitize_to_id(name) }.update(options.stringify_keys)
        
        clientid = sanitize_to_id(name)
        widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid         
        
        options_ui = options
        options_ui = options_ui.merge(:id => clientid )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('Dropdown','#{widgetvar}',#{options_ui})"
        script += '});'         
        output += p_javascript_tag(script, "id" => clientid+"_s")         
      end   
      
      def p_button_tag(content_or_options = nil, options = nil, &block)       
        options = content_or_options if block_given? && content_or_options.is_a?(Hash)
        options ||= {}
        options = options.stringify_keys

        if disable_with = options.delete("disable_with")
          message = ":disable_with option is deprecated and will be removed from Rails 4.1. " \
                    "Use 'data: { disable_with: \'Text\' }' instead."
          ActiveSupport::Deprecation.warn message

          options["data-disable-with"] = disable_with
        end

        if confirm = options.delete("confirm")
          message = ":confirm option is deprecated and will be removed from Rails 4.1. " \
                    "Use 'data: { confirm: \'Text\' }' instead'."
          ActiveSupport::Deprecation.warn message

          options["data-confirm"] = confirm
        end

        options.reverse_merge! 'name' => 'button', 'type' => 'submit'
        
        clientid = sanitize_to_id(options["id"])

        if options['ajax']
            options['onclick'] = ''  if !options.has_key?('onclick') 
        	options['onclick'] += "PrimeFaces.ab({source: '#{clientid}'});return false;" 
        end
            
        output = content_tag :button, content_or_options || 'Button', options, &block
                
        widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid         
        
        options_ui = options
        options_ui = options_ui.merge(:id => clientid )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('Button','#{widgetvar}',#{options_ui})"
        script += '});'         
        output += p_javascript_tag(script, "id" => clientid+"_s")                                             
      end                   
      
end