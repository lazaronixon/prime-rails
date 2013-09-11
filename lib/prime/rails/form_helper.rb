module ActionView
	module Helpers
		module FormHelper
      		def p_text_field(object_name, method, options = {})
        		Tags::TextField.new(object_name, method, self, options).p_render
      		end
      		
      		def p_text_area(object_name, method, options = {})
        		Tags::TextArea.new(object_name, method, self, options).p_render
      		end 
      		
     	 	def p_button(value = nil, options = {}, &block)
        		value, options = nil, value if value.is_a?(Hash)
        		value ||= submit_default_value
        	    @template.p_button_tag(value, options, &block)
      		end       	 		     		
        end
    end       
end