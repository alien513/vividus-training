Scenario: Navigate to the website homepage
Given I am on main application page
When I wait until element located by `caseSensitiveText(Swag Labs)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`

Scenario: Log in as Locked User
When I enter `${swagLockedUserName}` in field located by `id(user-name)`
And I enter `${swagPassword}` in field located by `id(password)`
And I click on element located by `id(login-button)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
And number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`