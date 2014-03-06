Feature: Adding items to shopping cart
	In order to purchase an item
	As a user
	I want to add items to my shopping cart
	
	Scenario: Add to cart as a guest
		Given I am not signed in
		When I visit the main page
		And I click an item's "Add to Cart" button
		Then I should be redirected to the sign-in screen
		
	Scenario: Add to cart as a user
		Given I am signed in as a user
		When I visit the main page
		And I click an item's "Add to Cart" button
		Then the base quantity of that item should be added to my cart