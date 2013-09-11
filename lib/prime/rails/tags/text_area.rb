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
          
          clientId = sanitize_to_id(options["id"])
          widgetVar = options["var"] ? options["var"] : "widget_"+clientId  
          
          options_ui = options
          options_ui = options_ui.merge(:id => clientId )                         
          options_ui = options_ui.to_json              
          
          script = '$(function() {'
          script += "PrimeFaces.cw('InputTextarea','#{widgetVar}',#{options_ui})"
          script += '});'         
          output += javascript_tag(script, "id" => clientId+"_s")               
          
        end
      end
    end
  end
end