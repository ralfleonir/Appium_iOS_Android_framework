@log_in
Feature: As a user I want to log in on FCA app

    Background:
        Given I am on FCA login page

    @log_in_facebook
    Scenario: Log in using Facebook account
        When I select Entrar com Facebook
        Then I should see Welcome screen
