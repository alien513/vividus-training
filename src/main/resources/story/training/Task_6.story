Meta:
    @group Training
    @requirementId MyTask-0006

Lifecycle:
Examples:
|userName					|password		|
|standard_user				|secret_sauce	|
|performance_glitch_user	|secret_sauce	|

Scenario: Navigate to the website homepage
Given I am on main application page
When I wait until element located by `caseSensitiveText(Swag Labs)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`

Scenario: Log In
When I enter `<userName>` in field located by `id(user-name)`
And I enter `<password>` in field located by `id(password)`
And I click on element located by `id(login-button)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`

Scenario: Add item to the shopping cart
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
When I click on element located by `<addToCartButtonId>`
Then text `<itemName>` exists
Then an element with the attribute 'id'='<itemPageId>' exists
Examples:
| itemName     			  | itemPageId       	| addToCartButtonId         			  |
| Sauce Labs Backpack     | item_4_title_link	| id(add-to-cart-sauce-labs-backpack)     |
| Sauce Labs Bike Light   | item_0_title_link   | id(add-to-cart-sauce-labs-bike-light)   |
| Sauce Labs Fleece Jacket| item_5_title_link	| id(add-to-cart-sauce-labs-fleece-jacket)|

Scenario: Validate the num of items in the shopping cart
When I click on an element with the attribute 'class'='shopping_cart_link'
Then `${current-page-url}` is equal to `https://www.saucedemo.com/cart.html`
Then number of elements found by `xpath(//div[@class='cart_item'])` is equal to `3`

Scenario: Log Out
When I click on element located by `id(react-burger-menu-btn)`
And I click on element located by `id(reset_sidebar_link)`
And I click on element located by `id(logout_sidebar_link)`