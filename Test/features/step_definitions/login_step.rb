# encoding: utf-8

Given(/^I visit login page$/) do
    login.load
end
  
Given(/^I'm on login page$/) do
    expect(page).to have_current_path('/login')
end

When(/^I try to login with user "([^"]*)" and password "([^"]*)"$/) do |username, password|
  login.loginIn(username, password)
end

Then(/^I can see the welcome page$/) do
  expect(page).to have_current_path('/employees')
end

Then(/^I should see the error message "([^"]*)"$/) do |message|
  page.should have_content message
end