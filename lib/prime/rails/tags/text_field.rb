module ActionView
  module Helpers
    module Tags # :nodoc:
      class TextField < Base # :nodoc:
      	include Helpers::JavaScriptHelper
        def p_render
          options = @options.stringify_keys
          options["size"] = options["maxlength"] unless options.key?("size")
          options["type"]  ||= field_type
          options["value"] = options.fetch("value"){ value_before_type_cast(object) } unless field_type == "file"
          options["value"] &&= ERB::Util.html_escape(options["value"])
          add_default_name_and_id(options)
          output = tag("input", options)
          
          clientId = sanitize_to_id(options["id"])
          widgetVar = options["var"] ? options["var"] : "widget_"+clientId    
          script = '$(function() {'
          script += "PrimeFaces.cw('InputText','#{widgetVar}',{id: '#{clientId}' })"
          script += '});'         
          output += javascript_tag(script, "id" => clientId+"_s")              
          
        end
      end
    end
  end
end