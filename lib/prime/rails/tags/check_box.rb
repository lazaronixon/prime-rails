module ActionView
  module Helpers
    module Tags # :nodoc:
      class CheckBox < Base #:nodoc:
        include Helpers::JavaScriptHelper  
        def p_render
          options = @options.stringify_keys
          options["type"]     = "checkbox"
          options["value"]    = @checked_value
          options["checked"] = "checked" if input_checked?(object, options)

          if options["multiple"]
            add_default_name_and_id_for_value(@checked_value, options)
            options.delete("multiple")
          else
            add_default_name_and_id(options)
          end

          include_hidden = options.delete("include_hidden") { true }
          checkbox = tag("input", options)

          if include_hidden
            hidden = hidden_field_for_checkbox(options)
            output = hidden + checkbox
          else
            output = checkbox
          end
          
        clientid = sanitize_to_id(options["id"])
        widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid         
        
        options_ui = options
        options_ui = options_ui.merge(:id => clientid )                         
        options_ui = options_ui.to_json        
        
        script = '$(function() {'
        script += "PrimeFaces.cw('CheckBox','#{widgetvar}',#{options_ui})"
        script += '});'         
        output += javascript_tag(script, "id" => clientid+"_s")           
          
        end                 
      end
    end
  end
end
