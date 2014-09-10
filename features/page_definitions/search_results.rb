require 'page-object'
class SearchResults
  include PageObject

  unordered_list(:results, :class => 'repo-list js-repo-list')

end