require 'page-object'

class LoggedIn
  include PageObject

  span(:username, :class => 'css-truncate-target')
end