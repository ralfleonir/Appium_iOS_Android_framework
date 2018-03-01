Given(/^I am logged in on FCA Fiat app$/) do
# this step assumes user is current landing on Welcome screen if already logged in

 begin
    @app_welcome_screen = WelcomeScreen.new
    expect(@app_welcome_screen.conect_your_car_button).not_to be_nil
  rescue
	 @login_screen = LoginScreen.new
     @fb_login_screen = @login_screen.select_FB_login
     @app_welcome_screen = @fb_login_screen.login_facebook(ENV['USER_NAME'], ENV['USER_PASS'])
     expect(@app_welcome_screen.conect_your_car_button).not_to be_nil
 end
end

When(/^I select the button "([^"]*)"$/) do |button|
 if (button == "Conecte seu carro")
     @app_welcome_screen.select_conecte_seu_carro
   elsif (button == "Digitar o numero do chassi")
     @chassis_screen = ChassisScreen.new
     @chassis_screen.select_type_chassis_number_button
     expect(@chassis_screen.chassis_field).not_to be_nil
 end
end

When(/^I insert the chassis number "([^"]*)"$/) do |chassis_number|
  if (chassis_number == 'Ax7')
  	  @chassis_screen.type_chassis_number(ENV['CHASSI_NUMBER_A'])
    elsif (chassis_number == 'Bx7')
    	@chassis_screen.type_chassis_number(ENV['CHASSI_NUMBER_B'])
    elsif (chassis_number == 'Cx7')
    	@chassis_screen.type_chassis_number(ENV['CHASSI_NUMBER_C'])
  end
end

