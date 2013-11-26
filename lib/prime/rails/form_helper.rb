require File.dirname(__FILE__) + '/tags/text_field.rb'
require File.dirname(__FILE__) + '/tags/text_area.rb'
require File.dirname(__FILE__) + '/tags/check_box.rb'
require File.dirname(__FILE__) + '/tags/select.rb'

module ActionView::Helpers
  module FormHelper
    def p_text_field(object_name, method, options = {})
      Tags::TextField.new(object_name, method, self, options).p_render
    end

    def p_text_area(object_name, method, options = {})
      Tags::TextArea.new(object_name, method, self, options).p_render
    end

    def p_check_box(object_name, method, options = {}, checked_value = "1", unchecked_value = "0")
      Tags::CheckBox.new(object_name, method, self, checked_value, unchecked_value, options).p_render
    end

    def p_select(object, method, choices, options = {}, html_options = {})
      Tags::Select.new(object, method, self, choices, options, html_options).p_render
    end

    def p_button(value = nil, options = {}, &block)
      value, options = nil, value if value.is_a?(Hash)
      value ||= submit_default_value
      @template.p_button_tag(value, options, &block)
    end
  end

  class FormBuilder

    class_attribute :p_field_helpers
    self.p_field_helpers = [:p_text_field,:p_text_area]

    (p_field_helpers).each do |selector|
      class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
      def #{selector}(method, options = {})  # def text_field(method, options = {})
        @template.send(                      #   @template.send(
          #{selector.inspect},               #     "text_field",
          @object_name,                      #     @object_name,
          method,                            #     method,
          objectify_options(options))        #     objectify_options(options))
      end                                    # end
     RUBY_EVAL
    end

    def p_button(value = nil, options = {}, &block)
      value, options = nil, value if value.is_a?(Hash)
      value ||= submit_default_value
     @template.p_button_tag(value, options, &block)
    end

    def p_check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      @template.p_check_box(@object_name, method, objectify_options(options), checked_value, unchecked_value)
    end

    def p_select(method, choices, options = {}, html_options = {})
      @template.p_select(@object_name, method, choices, objectify_options(options), @default_options.merge(html_options))
    end
  end
end