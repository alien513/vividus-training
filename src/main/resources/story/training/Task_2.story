GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
When I enter `${swagGoodUserName}` in field located by `id(user-name)`
And I enter `${swagPassword}` in field located by `id(password)`
And I click on element located by `id(login-button)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
And number of elements found by `xpath(//div[@class='inventory_item'])` is equal to `6`
When I take screenshot