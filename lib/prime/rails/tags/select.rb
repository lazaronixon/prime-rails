module ActionView
  module Helpers
    module Tags # :nodoc:
      class Select < Base # :nodoc:
        include Helpers::JavaScriptHelper

        def p_render          
          option_tags_options = {
            :selected => @options.fetch(:selected) { value(@object) },
            :disabled => @options[:disabled]
          }

          option_tags = if grouped_choices?
            grouped_options_for_select(@choices, option_tags_options)
          else
            options_for_select(@choices, option_tags_options)
          end

          p_select_content_tag(option_tags, @options, @html_options)                  
        end
        
        def p_select_content_tag(option_tags, options, html_options)
          html_options = html_options.stringify_keys
          add_default_name_and_id(html_options)
          options[:include_blank] ||= true unless options[:prompt] || select_not_required?(html_options)
          select = content_tag("select", add_options(option_tags, options, value(object)), html_options)

          if html_options["multiple"] && options.fetch(:include_hidden, true)
            output = tag("input", :disabled => html_options["disabled"], :name => html_options["name"], :type => "hidden", :value => "") + select
          else
            output = select
          end

          clientid = sanitize_to_id(html_options["id"])
          widgetvar = options.has_key?("widgetVar") ? options["widgetVar"] : "widget_"+clientid         
        
          options_ui = options
          options_ui = options_ui.merge(:id => clientid )                         
          options_ui = options_ui.to_json        
        
          script = '$(function() {'
          script += "PrimeFaces.cw('Dropdown','#{widgetvar}',#{options_ui})"
          script += '});'         
          output += javascript_tag(script, "id" => clientid+"_s")                
        end        

      end
    end
  end
end
