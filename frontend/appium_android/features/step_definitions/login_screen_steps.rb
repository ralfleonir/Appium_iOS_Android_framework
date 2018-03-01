### Given ###
Given(/^I am on FCA login page$/) do
  @loginScreen = LoginScreen.new
end

### When ###
When(/^I select Entrar com Facebook$/) do
  @welcomeScreen = @loginScreen.click_facebook_button
end

### Then ###
Then(/^I should see Welcome screen$/) do
  #this validation is made on click_facebook_button
end
