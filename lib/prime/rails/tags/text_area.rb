module ActionView
  module Helpers
    module Tags # :nodoc:
      class TextArea < Base # :nodoc:
      	include Helpers::JavaScriptHelper      
        def p_render
          options = @options.stringify_keys
          add_default_name_and_id(options)

          if size = options.delete("size")
            options["cols"], options["rows"] = size.split("x") if size.respond_to?(:split)
          end

          output = content_tag("textarea", options.delete('value') || value_before_type_cast(object), options)
          
          clientid = sanitize_to_id(options["id"])
          widgetvar = options["var"] ? options["var"] : "widget_"+clientid  
          
          options_ui = options
          options_ui = options_ui.merge(:id => clientid )                         
          options_ui = options_ui.to_json              
          
          script = '$(function() {'
          script += "PrimeFaces.cw('InputTextarea','#{widgetvar}',#{options_ui})"
          script += '});'         
          output += p_javascript_tag(script, "id" => clientid+"_s")               
          
        end
      end
    end
  end
end