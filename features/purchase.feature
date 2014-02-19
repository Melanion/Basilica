Feature: Purchase an item
	In order to purchase an item
	As a user
	I want to exchange credits for item(s)
	
	Scenario: Purchase an item
		Given I am viewing the storefront
		And I am logged into my valid store account
		And I click the “Purchase” button next to an item
		Then the displayed quantity of that item should decrease
		And my displayed credits should decrease
		And the item should be delivered to the pickup chest in-game