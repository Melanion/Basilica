Feature: Viewing store inventory
	In order to view the store's inventory
	As a site user
	I want to see the store's items
	
	Scenario: View inventory as a guest
		Given I am not signed in
		When I visit the main page
		Then I should see a list of items
		
	Scenario: View inventory as authenticated user
		Given I am signed in as a user
		When I visit the main page
		Then I should see a list of items
		And I should see "Add to cart" buttons next to each item
		
	Scenario: View inventory as an admin
		Given I am signed in as an administrator
		When I visit the main page
		Then I should see a list of items
		And I should see "Modify" buttons next to each item
		And I should see a "Modify Inventory" button