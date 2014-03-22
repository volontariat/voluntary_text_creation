module VoluntaryTextCreation
  class Engine < ::Rails::Engine
    config.i18n.load_path += Dir[File.expand_path("../../../config/locales/**/*.{rb,yml}", __FILE__)]
    
    config.to_prepare do
      Voluntary::Navigation::Base.add_product('text-creation', 'workflow.user.products.text_creation.title')
    end
  end
end
