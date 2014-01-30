Given /^a user named "([^\"]*)"$/ do |name|
  @me = FactoryGirl.create(:user, name: name, email: "#{name.gsub(' ', '_')}@volontari.at")  
  @me.reload
end