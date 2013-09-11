module ActionView::Helpers::FormTagHelper
      def p_text_field_tag(name, value = nil, options = {})
        options = options.stringify_keys
        clientId = sanitize_to_id(name)
        widgetVar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientId
        output = tag :input, { "type" => "text", "name" => name, "id" => sanitize_to_id(name), "value" => value }.update(options.stringify_keys)

        script = '$(function() {'
        script += "PrimeFaces.cw('InputText','#{widgetVar}',{id: '#{clientId}' })"
        script += '});'         
        output += javascript_tag(script, "id" => clientId+"_s")
                       
      end                         
      
      def p_text_area_tag(name, content = nil, options = {})        
        options = options.stringify_keys
        clientId = sanitize_to_id(name)
        widgetVar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientId        

        if size = options.delete("size")
          options["cols"], options["rows"] = size.split("x") if size.respond_to?(:split)
        end

        escape = options.delete("escape") { true }
        content = ERB::Util.html_escape(content) if escape        

        output = content_tag :textarea, content.to_s.html_safe, { "name" => name, "id" => sanitize_to_id(name) }.update(options)                
        
        options_ui = options
        options_ui = options_ui.merge(:id => clientId )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('InputTextarea','#{widgetVar}',#{options_ui})"
        script += '});'         
        output += javascript_tag(script, "id" => clientId+"_s")        
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

        if options['ajax'] == 'true'
            options['onclick'] = ''  if !options.has_key?('onclick') 
        	options['onclick'] += "PrimeFaces.ab({source: 'this'});return false;" 
        end
            
        output = content_tag :button, content_or_options || 'Button', options, &block
        
        clientId = sanitize_to_id(options["id"])
        widgetVar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientId         
        
        options_ui = options
        options_ui = options_ui.merge(:id => clientId )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('Button','#{widgetVar}',#{options_ui})"
        script += '});'         
        output += javascript_tag(script, "id" => clientId+"_s")                                             
      end                
      
      def p_check_box_tag(name, value = "1", checked = false, options = {})
        html_options = { "type" => "checkbox", "name" => name, "id" => sanitize_to_id(name), "value" => value }.update(options.stringify_keys)
        html_options["checked"] = "checked" if checked
        output = tag :input, html_options
        
        clientId = sanitize_to_id(name)
        widgetVar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientId         
        
        options_ui = options
        options_ui = options_ui.merge(:id => clientId )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('CheckBox','#{widgetVar}',#{options_ui})"
        script += '});'         
        output += javascript_tag(script, "id" => clientId+"_s")         
        
      end      
      
end