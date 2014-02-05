Feature: View the main page
	In order to view the main page
	As a visitor
	I want to see the main page
	
	Scenario: View the main page
		Given I am on the main page
		Then I should see "Basilica"
		And I should see "Item"
		And I should see "Quantity"