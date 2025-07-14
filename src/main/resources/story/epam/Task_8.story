Meta:
    @group Epam

Scenario: Check the title is correct
Given I am on main application page
Then page title is equal to `EPAM | Software Engineering & Product Development Services`
And `${current-page-url}` is equal to `https://www.epam.com/`

Scenario: Check the ability to switch Light / Dark mode
Given I am on main application page
When I click on element located by `xpath(//*[@class='theme-switcher'])`
Then an element with the attribute 'class' containing 'fonts-loaded light-mode' exists
When I click on element located by `xpath(//*[@class='theme-switcher'])`
Then an element with the attribute 'class' containing 'fonts-loaded dark-mode' exists

Scenario: Check that allow to change language to UA
Given I am on main application page
When I click on element located by `xpath(//*[@class='location-selector__button-language'])`
And I click on element located by `xpath(//*[@lang='uk'])`
Then `${current-page-url}` is equal to `https://careers.epam.ua/`

Scenario: Check the policies list
Given I am on main application page
Then text `<policy>` exists
Examples:
| policy                      |
| INVESTORS                   |
| COOKIE POLICY               |
| OPEN SOURCE                 |
| APPLICANT PRIVACY NOTICE    |
| PRIVACY POLICY              |
| WEB ACCESSIBILITY           |

Scenario: Check that allow to switch location list by region
Given I am on main application page
Then text `Our Locations` exists
When I click on element located by `<dataItem>`
Then text `<location>` exists
Examples:
| dataItem									 | location  |
| xpath(//*[@role='tab' and @data-item='0']) | AMERICAS  |
| xpath(//*[@role='tab' and @data-item='1']) | EMEA 	 |
| xpath(//*[@role='tab' and @data-item='2']) | APAC		 |

Scenario: Check the search function
Given I am on main application page
When I click on element located by `xpath(//*[@class='header-search__button header__icon'])`
When I enter `AI` in field located by `id(new_form_search)`
And I click on element located by `xpath(//*[@class='bth-text-layer'])`
Then text `Search` exists

Scenario: Check that the Company logo on the header lead to the main page
Given I am on page with URL `https://www.epam.com/about`
When I click on element located by `xpath(//*[@class='header__logo-link'])`
Then `${current-page-url}` is equal to `https://www.epam.com/`

