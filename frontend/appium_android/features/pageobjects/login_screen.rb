class LoginScreen < BasePage

  ### Trait ###
  def trait; @facebook_button_id; end

  ### Elements ids ###
  def initialize
    @facebook_button_id = "ll_facebook"
    @email_button_id = "ll_email"
  end

  ### actions ###
  def click_facebook_button
    Button.new(@facebook_button_id).click
    WelcomeScreen.new
  end

  def click_email_button
    Button.new(@email_button_id).click
    LoginEmailScreen.new
  end

end
