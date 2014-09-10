Feature: Testing Github
  Scenario: Searching a project
    When I search for 'grailsblog'
    Then I should see a-chancey's repository for grailsblog in the results

  Scenario: Logging in
    When I enter valid credentials
    Then I should be logged into the system

  Scenario: failing to log in
    When I enter invalid credentials
    Then I should be presented with an error

  Scenario: registering with an already taken username
    When I try to register with an existing username
    Then I should get an error that the username exists

  Scenario: registering with an already taken email address
    When I try to register with an existing email address
    Then I should get an error that the email already exists

  Scenario Outline: Registering using an invalid password
    When I try to register with an invalid password such as <password>
    Then I should receive an error <message>
  Examples:
    | password | message |
    | a        | Password is too short (minimum is 7 characters) and needs at least one number |
    | A        | Password is too short (minimum is 7 characters), needs at least one lowercase letter, and needs at least one number |
    | 1        | Password is too short (minimum is 7 characters) and needs at least one lowercase letter                             |
    | a1       | Password is too short (minimum is 7 characters)                                                                 |


