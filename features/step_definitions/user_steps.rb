Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |username, email, password|
  User.new(:username => username,
           :email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am not logged in$/ do
  visit('/users/sign_out') # ensure that at least
end

Then /^I should be already signed in$/ do
  And %{I should see "Sign out"}
end
