def user
  @user ||= User.create!(username: "username", email: "test@test.com", password: "secrete")
end

Given(/^I am loged in as User$/) do
  user
  login_as(@user)
end

Given(/^I have character types named (.+)$/) do |names|
  file =  File.open("#{Rails.root}/spec/support/avatars/test.jpg")
  names.split(", ").each do |name|
    CharacterType.create!(name: name, user_id: @user.id, character_avatar: file)
  end
end

When(/^I go to the list of character types$/) do
  visit character_types_path
end

Then(/^I should see "([^\"]*)"$/) do |string|
  expect(page).to have_content(string)
end

Given(/^I have no character types$/) do
  CharacterType.delete_all
end

Given(/^I am on the list of character types$/) do
  visit character_types_path
end

When(/^I follow "([^\"]*)"$/) do |link|
  click_link(link)
end

When(/^I fill in "([^\"]*)" with "([^\"]*)"$/) do |field, value|
  fill_in(field, :with => value) 
end

Then("I attach Avatar") do
  click_button("Add Avatar")
  file =  File.open("#{Rails.root}/spec/support/avatars/test.jpg")
  attach_file('character_type[character_avatar]', file.path, visible: false)
end


When(/^I click "([^\"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should have (\d+) character type$/) do |count|
  CharacterType.count.should == count.to_i
end


When(/^I click on option "([^\"]*)" on first "([^\"]*)"$/) do |button, name|
  chars = CharacterType.where(name: name)
  char = chars.first
  find(:css, "#char-id#{char.id}", text: "#{button}").click
end


Then(/^I see popup "([^\"]*)"$/) do |string|
  page.driver.browser.switch_to.alert.text.should  eq(string)
end

Then(/^I confirm popup$/) do
  page.driver.browser.switch_to.alert.accept
end


