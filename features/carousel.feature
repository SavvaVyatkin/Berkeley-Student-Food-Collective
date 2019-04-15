Feature: View and Interact with a Carousel of Products and Vendors

  As a customer
  In order to discover new products in a category
  I want to see a carousel of vendors or products with the same tag on the discovery page

  @javascript
  Scenario: Hover Slide Interaction with Carousel (happy)
  	Given I create three new vendors
  	And I am on the Discovery page
  	And I hover over the second carousel element
	Then the left elements should shift to the left
	And the right elements should shift to the right

  @javascript
  Scenario: 
    Given I create three new products
    And I am on the Discovery page
  	And I see a carousel for the product tag type "Original Packaging Name" 
	Then I should see all products with the tag "Original Packaging Name"

  @javascript
  Scenario: 
    Given I create three new vendors
    And I am on the Discovery page
  	And I see a carousel for the ownership type "Original Ownership Name" 
	Then I should see all vendors with owned by "Original Ownership Name"

	
	
 