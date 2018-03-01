Given(/^I am on FCA Fiat app login page$/) do
  @login_screen = LoginScreen.new
  expect(@login_screen).to be_instance_of(LoginScreen)
  expect(@login_screen.fbButton).not_to be_nil
end

When(/^I select "([^"]*)"$/) do |button|
  @fb_login_screen = @login_screen.select_FB_login
  expect(@fb_login_screen).to be_instance_of(FacebookLoginScreen)
end

When(/^I submit a valid user login data$/) do
  # this pass through facebook login and its login confirmation screen
  @app_welcome_screen = @fb_login_screen.login_facebook(ENV['USER_NAME'], ENV['USER_PASS'])
  expect(@fb_login_screen.fb_conf_button).not_to be_nil
end

Then(/^I should see Welcome screen$/) do
  expect(@app_welcome_screen).to be_instance_of(WelcomeScreen)
  expect(@app_welcome_screen.conect_your_car_button).not_to be_nil
end

