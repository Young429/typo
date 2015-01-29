Feature: Merge Articles
  As a blog administrator
  In order to reduce the number of duplicated or similar aricles
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist
      | title                   | body                               |
      | First similar Article   | The body content for first article |
      | Second similar Article  | Content for the second article     |
    And the following comments for article "First similar Article" exist
      | author        | body                |
      | Person 1      | The first comment   |
      | Person 2      | The second comment  |
    And the following comments for article "Second similar Article" exist
      | author        | body                |
      | Person 3      | The third comment   |
      | Person 4      | The fourth comment  |

  Scenario: Successfully merge articles
    Given I am on the admin article page for "First similar Article"
    And I fill in "merge_with" with id for article "Second similar Article"
    And I press "Merge"
    Then the article "First similar Article" should have body "The body content for first article Content for the second article"
    And all comments from "Second similar Article" should be linked to "First similar Article"
#    And show me the page

  Scenario: Fail to merge article with itself
    Given I am on the admin article page for "First similar Article"
    And I fill in "merge_with" with id for article "First similar Article"
    And I press "Merge"
    Then the article "First similar Article" should have body "The body content for first article"
    And I should see "Cannot merge article with itself"
