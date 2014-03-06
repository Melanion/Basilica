Feature: User shopping cart
	In order to use my shopping cart
	As a site user
	I want to view and modify my cart items
	
	Scenario: View shopping cart
		When I visit the shopping cart page
		Then I should see a list of items in my cart
		And I should see a quantity next to each item
		And I should see an "Empty Cart" button
		And I should see a "Checkout" button
		
	Scenario: Modify quantity
		Given I am at the shopping cart page
		When I type a new value into a quantity field
		And I hit submit
		Then the displayed quantity of the item should be changed
		
	Scenario: Empty cart
		Given I am at the shopping cart page
		When I click the "Empty Cart" button
		Then the list of items in my cart should be empty
		
	Scenario: Checkout with sufficient funds
		Given I am at the shopping cart page
		And I have sufficient credits to exchange for all my items
		When I click the "Checkout" button
		Then the items in my cart should transfer to my personal inventory
		And my cart should be empty
		And my credits should decrease by the total price of the items
		
	Scenario: Checkout with insufficient funds
		Given I am at the shopping cart page
		And I do not have sufficient credits to exchange for all my items
		When I click the "Checkout" button
		Then I should see an "Insufficient funds" warning
		And my cart should not change