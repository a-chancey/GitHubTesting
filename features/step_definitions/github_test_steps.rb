require 'watir-webdriver'
require 'page-object'

include PageObject::PageFactory

When(/^I search for 'grailsblog'$/) do
  visit_page GithubHome
  on_page GithubHome do |page|
  page.search = 'grailsblog'
    @browser.send_keys :enter
  end
end


Then(/^I should see a\-chancey's repository for grailsblog in the results$/) do
  on_page SearchResults do |page|
  expect(page.results).to include('a-chancey/GrailsBlog')
  end
end

When(/^I enter valid credentials$/) do
  visit_page GithubLogin
  on_page GithubLogin do |page|
  page.username = '<username>'
  page.password = '<password>'
  page.submit
  end
end

Then(/^I should be logged into the system$/) do
  on_page LoggedIn do |page|
  expect(page.username).to eq('a-chancey')
  end
end

When(/^I enter invalid credentials$/) do
  visit_page GithubLogin
  on_page GithubLogin do |page|
    page.username = 'a-chancey'
    page.password = 'sdafadsjklf'
    page.submit
  end
end

Then(/^I should be presented with an error$/) do
  on_page GithubLogin do |page|
    expect(page.error).to include('Incorrect')
  end
end

When(/^I try to register with an existing username$/) do
  visit_page GithubHome
  on_page GithubHome do |page|
    page.new_username = 'a-chancey'
    sleep(1)

  end

end

Then(/^I should get an error that the username exists$/) do
  on_page GithubHome do |page|
  expect(page.user_error).to include('Username is already taken')
  end
end

When(/^I try to register with an existing email address$/) do
  visit_page GithubHome
  on_page GithubHome do |page|
    page.new_email = 'abchiptop@gmail.com'
    sleep(1)
  end
end

Then(/^I should get an error that the email already exists$/) do
  on_page GithubHome do |page|
    expect(page.user_error).to include('Email is invalid or already taken')
  end

end

When(/^I try to register with an invalid password such as (.*)$/) do |password|
  visit_page GithubHome
  on_page GithubHome do |page|
  page.user_password = password
    sleep(1)
  end
end

Then(/^I should receive an error (.*)$/) do |message|
  on_page GithubHome do |page|
    expect(page.user_error).to eq(message)
  end
end