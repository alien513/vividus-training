Scenario: Navigate to the website homepage
Given I am on main page
When I ${baselineAction} baseline with name `testBaseline` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE	|
|5							|

Scenario: Log in as a Good User
When I log in as a user with name ${swagBrokenUserName} and password ${swagPassword}
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I ${baselineAction} baseline with name `testBaseline_dynamic` ignoring:
|ELEMENT									  |ACCEPTABLE_DIFF_PERCENTAGE	|
|By.xpath(//*[@class='inventory_item_img']//.)|7							|
