class FacebookLoginScreen < BasePage

  attr_reader :fb_conf_button

  def initialize
   # find the email field only if it has its placeholder visible
   wait { @fb_email_field = textfield("Email") }
   @fbPassField = textfield("Password")
   @fbButtonLogin = button("Log In")
  end
    
  def login_facebook (user, password)
    @fb_email_field.type(user)
    @fbPassField.type(password)
    @fbButtonLogin.click
    # facebook login confirmation screen
    wait { @fb_conf_button = find_exact('OK').click }
    WelcomeScreen.new
  end
end
