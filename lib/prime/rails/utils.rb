require 'rails'

module Prime
  module Rails
    module Utils

      protected

      def p_ajax_resp(options = {})
        options = options.stringify_keys
        output = "<partial-response>"
        output += "<changes>"

        options['update'] = {} if !options.has_key?('update')
        options['update'].each do |update|
          update = update.stringify_keys
          updateid = update['id']
          updateresp = update['resp']
          output += %{<update id="#{updateid}"><![CDATA[#{updateresp}]]></update>}
        end

        output += "</changes>"
        output += "</partial-response>"
      end

    end
  end
end