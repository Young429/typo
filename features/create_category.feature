Feature: Create Category
  As an author
  In order to help me better organise my posts
  I want to be able to create and modify categories in Typo

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Create a new category
    When I go to admin categories new page
    And I fill in "category_name" with "Category Name"
    And I fill in "category_keywords" with "test category sample"
    And I fill in "category_description" with "Some sample category added during testing with cucumber"
    And I press "Save"
    Then I should be on admin categories new page
    And I should see "Category was successfully saved."

  Scenario: Attempt to save blank category
    When I go to admin categories new page
    And I press "Save"
    Then I should be on admin categories new page
    And I should see "Category could not be saved."