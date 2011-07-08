Feature: Static pages
  In order to browse some pages to get familiar what the website is about
  As a visitor
  I want to browse some static pages

  Scenario: static pages
    Given I am not logged in
    And a user exists with full_name: "Samnang"
    Then I should be able to browse the following pages:
      | example katas | Example Katas |
      | users         | Users         |
      | user's        | Samnang       |
