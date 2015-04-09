def r_str
  SecureRandom.hex(3)
end

def resource_has_many(resource, association_name)
  association = if resource.send(association_name).length > 0
    nil
  elsif association_name.to_s.classify.constantize.count > 0
    association_name.to_s.classify.constantize.last
  else
    Factory.create association_name.to_s.singularize.to_sym
  end
  
  resource.send(association_name).send('<<', association) if association
end

FactoryGirl.define do
  Voluntary::Test::RspecHelpers::Factories.code.call(self)
  
  factory :text_creation_product, parent: :product, class: Product::TextCreation do
    name 'Text Creation'
  end

  factory :text_creation_project, parent: :project do
    association :product, factory: :text_creation_product
  end
  
  factory :text_creation_story, parent: :story, class: Product::TextCreation::Story do
    association :project, factory: :text_creation_project
    with_keywords true
    min_number_of_keywords 1
    max_number_of_keywords 3
    language 'en'
    min_length 10
    max_length 50
      
    ignore { task_factory :text_creation_task }
  end
  
  factory :text_creation_task, parent: :task, class: Product::TextCreation::Task do
    keywords ['Keyword 1']
  end
end
