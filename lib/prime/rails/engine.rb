require 'rails'

require File.dirname(__FILE__) + '/prime-rails-breadcrumbs.rb'
require File.dirname(__FILE__) + '/utils.rb'
require File.dirname(__FILE__) + '/form_tag_helper.rb'
require File.dirname(__FILE__) + '/javascript_helper.rb'
require File.dirname(__FILE__) + '/form_helper.rb'
require File.dirname(__FILE__) + '/url_helper.rb'

module Prime
  module Rails    
  	class Engine < ::Rails::Engine
    	initializer 'prime-rails.setup_helpers' do |app|
          app.config.to_prepare do
            ActionController::Base.send :include, BreadCrumbs            
            ActionController::Base.send :include, Utils
          end
        end
    end                
  end
end