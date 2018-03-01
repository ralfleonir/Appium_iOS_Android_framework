@log_in
Feature: As a user I want to log in on FCA Fiat app
  
    Background: 
        Given I am on FCA Fiat app login page

    @log_in_facebook
    Scenario: Log in using Facebook account
        When I select "Entrar com Facebook"
        And I submit a valid user login data
        Then I should see Welcome screen
