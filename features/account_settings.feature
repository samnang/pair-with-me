Feature: Account Settings
  In order let everyone see my skills and interests
  As a User
  I want to update my account settings

  Scenario: Public profile
    Given a user exists with username: "samnang" and is logged in
    When I follow "Account Settings"
    And I follow "Public Profile"
    Then I should see "samnang"
    When I fill in the following:
      | Full name    | Samnang Chhun                  |
      | About me     | I am a developer from Cambodia |
      | Skills       | Ruby, Rails, Cucumber, RSpec   |
      | Availability | 00 - 17 UTC                    |
      | Time zone    | UTC +7                         |
      | Website      | http://wowkhmer.com            |
      | Twitter      | samnangchhun                   |
      | Github       | samnang                        |
    And I press "Update"
    Then I should see "You updated your profile successfully."
    And I should be on user's page
    And I should see the following:
      | text                           |
      | Samnang Chhun                  |
      | I am a developer from Cambodia |
      | Ruby, Rails, Cucumber, RSpec   |
