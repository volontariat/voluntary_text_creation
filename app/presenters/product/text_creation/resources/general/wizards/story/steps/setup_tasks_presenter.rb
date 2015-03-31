class Product
  class TextCreation
    module Resources
      module General
        module Wizards
          module Story
            module Steps
              class SetupTasksPresenter < Presenter
                def form_options
                  { html: {class: 'floating_form form-vertical'}, url: story_path(resource), as: :story }
                end
              end
            end
          end
        end
      end
    end
  end
end