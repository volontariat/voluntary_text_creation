class Product::TextCreation::Resources::General::Wizards::Story::Steps::SetupTasksPresenter < Presenter
  def form_options
    { html: {class: 'floating_form form-vertical'}, url: story_path(resource), as: :story }
  end
end