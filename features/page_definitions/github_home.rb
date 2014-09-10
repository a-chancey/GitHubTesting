require 'page-object'

class GithubHome
  include PageObject

  page_url 'http://www.github.com'

  text_field(:search, :name => 'q')
  button(:sign_in, :class => 'button signin')
  text_field(:new_username, :name => 'user[login]')
  dd(:user_error, :class => 'error')
  text_field(:new_email, :name => 'user[email]')
  text_field(:user_password, :name => 'user[password]')
end