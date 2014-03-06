Feature: Viewing user inventory
	In order to view my inventory
	As a site user
	I want to see my stored items
	
	Scenario: View user inventory
		Given I am signed in as a user
		When I visit my inventory page
		Then I should see a list of the items in my inventory
		And I should see "Sell to Store" buttons next to each item
		And I should see my total credits