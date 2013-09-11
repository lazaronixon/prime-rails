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
          
          clientid = sanitize_to_id(options["id"])
          widgetvar = options["var"] ? options["var"] : "widget_"+clientid    
          script = '$(function() {'
          script += "PrimeFaces.cw('InputText','#{widgetvar}',{id: '#{clientid}' })"
          script += '});'         
          output += javascript_tag(script, "id" => clientid+"_s")              
          
        end
      end
    end
  end
end