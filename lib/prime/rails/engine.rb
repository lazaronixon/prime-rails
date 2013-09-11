require 'rails'

require File.dirname(__FILE__) + '/form_tag_helper.rb'
require File.dirname(__FILE__) + '/form_helper.rb'
require File.dirname(__FILE__) + '/tags/text_field.rb'
require File.dirname(__FILE__) + '/tags/text_area.rb'
require File.dirname(__FILE__) + '/../../../app/helpers/tabview_helper.rb'
require File.dirname(__FILE__) + '/../../../app/helpers/dialog_helper.rb'
require File.dirname(__FILE__) + '/../../../app/helpers/fieldset_helper.rb'

module Prime
  module Rails    
  	class Engine < ::Rails::Engine
    	initializer 'prime-rails.setup_helpers' do |app|
          app.config.to_prepare do
            ActionController::Base.send :helper, TabviewHelper                   
            ActionController::Base.send :helper, DialogHelper            
            ActionController::Base.send :helper, FieldsetHelper            
          end
        end
    end                
  end
end