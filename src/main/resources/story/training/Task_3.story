Scenario: Navigate to the website homepage
Given I am on main page

Scenario: Log in as a Good User
When I log in as a user with name ${swagGoodUserName} and password ${swagPassword}
