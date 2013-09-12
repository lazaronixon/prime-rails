require 'rails/generators'

module Primerails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Prime Rails to Asset Pipeline"

      def add_assets

        js_manifest = 'app/assets/javascripts/application.js'

        if File.exist?(js_manifest)
          
          js_require_block = "//= require jquery-ui\n" 
          js_require_block += "//= require primeui\n" 
          js_require_block += "//= require primefaces-core\n"
          js_require_block += "//= require primefaces-rails\n"
          insert_into_file js_manifest, js_require_block, :after => "jquery_ujs\n"        
        else
          copy_file "application.js", js_manifest
        end

        css_manifest = 'app/assets/stylesheets/application.css'

        if File.exist?(css_manifest)
          # Add our own require:
          content = File.read(css_manifest)
          if content.match(/require_tree\s+\.\s*$/)
            # Good enough - that'll include our primerails_and_overrides.css.less
          else
            style_require_block = "*= require css/primeui/primeui\n"
            style_require_block += "*= require jquery-ui\n"
            style_require_block += "*= require themes/aristo/theme\n"
            insert_into_file css_manifest, style_require_block, :after => "require_self\n"
          end
        else
          copy_file "application.css", "app/assets/stylesheets/application.css"
        end

      end

      def add_primerails        
        copy_file "primerails_and_overrides.css", "app/assets/stylesheets/primerails_and_overrides.css"
      end

      def cleanup_legacy
        # Remove old requires (if any) that included primerails directly:
        gsub_file("app/assets/stylesheets/application.css", %r|\s*\*=\s*primeui\s*\n|, "")
      end
    end
  end
end