require 'page-object'
class GithubLogin
  include PageObject
  page_url 'http://github.com/login'

  text_field(:username, :id => 'login_field')
  text_field(:password, :id => 'password')
  button(:submit, :name => 'commit')

  div(:error, :class => 'flash flash-error')
end