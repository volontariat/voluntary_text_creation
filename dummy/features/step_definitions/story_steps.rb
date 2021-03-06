module StoryFactoryMethods
  def new_story(name, options = {})
    factory = options[:factory] || :story
    attributes = options[:attributes] || {}
    
    attributes.merge!({name: name})
    set_story_defaults(attributes)
    @story = FactoryGirl.create(factory, attributes)
    
    @story.reload
  end
    
  def set_story_defaults(attributes)
    attributes[:offeror_id] ||= @me.id if @me && !attributes[:offeror_id]
    attributes[:project_id] ||= @project.id if @project && !attributes[:project_id]
  end
end

World(StoryFactoryMethods)

Given /^a story named "([^\"]*)"$/ do |name|
  new_story(name)
end

Given /^a story without tasks named "([^\"]*)"$/ do |name|
  new_story(
    name, factory: :text_creation_story, 
    attributes: { task_factory: nil, event: 'initialization', state_before: 'new', state: 'initialized' }
  )
end

Then /^I should see the following stories:$/ do |expected_table|
  rows = find('table').all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  expected_table.diff!(table)
end

When /^(?:|I )press the first update tasks button$/ do
  find(:xpath, '/html/body/div[2]/div/div/div/div[2]/div[2]/form[2]/div[1]/button').click
end
