Given /^I am not logged in$/ do
  visit('/users/sign_out') # ensure that at least
end

Then /^I should be already signed in$/ do
  And %{I should see "Sign out"}
end

Given /^#{capture_model} exists(?: with #{capture_fields})? and is logged in$/ do |role, fields|
  user = create_model(role, fields)

  Given "a user is logged in with username: \"#{user.username}\", password: \"#{user.password}\"" 
end

Given /^a user is logged in with username: "([^"]*)", password: "([^"]*)"$/ do |username, password|
  visit new_user_session_path 

  fill_in "user_login", :with => username
  fill_in "user_password", :with => password

  click_button "Log in"
end
