@welcome_screen
Feature: As a user I want to connect my car to the app through its chassis number
  
    Background: 
        Given I am logged in on FCA Fiat app
    
    @conect_your_car
    Scenario: Insert the chassis number
        When I select the button "Conecte seu carro"
        And I select the button "Digitar o numero do chassi"
        And I insert the chassis number "Ax7"
       