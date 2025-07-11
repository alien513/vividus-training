Meta:
    @group Training
    @requirementId MyTask-0007

Lifecycle:
Examples:
|userName					|password		|
|standard_user				|secret_sauce	|

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
| Sauce Labs Bike Light   | item_0_title_link   | id(add-to-cart-sauce-labs-bike-light)   |

Scenario: Populate checkout data
When I click on an element with the attribute 'class'='shopping_cart_link'
Then `${current-page-url}` is equal to `https://www.saucedemo.com/cart.html`
When I click on element located by `id(checkout)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-one.html`
When I enter `#{generate(Name.firstName)}` in field located by `id(first-name)`
And I enter `#{generate(regexify '[A-Z]{5}[a-z]{5}')}` in field located by `id(last-name)`
And I enter `#{generate(regexify '[A-Z]{3}-\d{5}')}` in field located by `id(postal-code)`
And I take screenshot

Scenario: Complete checkout process
When I click on element located by `id(continue)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-two.html`
When I click on element located by `id(finish)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-complete.html`
When I save text of element located by `xpath(//*[@class='complete-header'])` to STORY variable `thankYouMessage`
Given I initialize STORY variable `expectedMessage` with value `#{loadResource(/data/message.txt)}`
Then `#{eval(`${thankYouMessage}` == `${expectedMessage}`)}` is equal to `true`
