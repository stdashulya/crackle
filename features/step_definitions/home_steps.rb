require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# Commonly used webrat steps
# http://github.com/brynary/webrat

Given /^A user exists with email "(.*)" and password "(.*)"$/ do |email, password|
  create :user, email: email, password: password
end

Given /^(.*) users exist$/ do |count|
  count.to_i.times { create :user }
end

Given /^A logged in user$/ do
  @user = create :user
  sign_in @user
end

Then /^I should see user's name$/ do
  page.body.should have_content @user.username
end

Then /^I should see user's email/ do
  page.body.should have_content @user.email
end

Then /^I should see all users$/ do
  users = User.all
  users.each { |u| page.body.should have_content u.username }
end

def sign_in(user)
  visit new_user_session_path
  fill_in("user_email", with: user.email)
  fill_in("user_password", with: "example")
  click_button("Sign in")
end