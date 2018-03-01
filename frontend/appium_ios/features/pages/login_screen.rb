class LoginScreen < BasePage

  attr_reader :fbButton

  def initialize
   wait { @fbButton = text("Entrar com o Facebook") }
  end
    
  def select_FB_login
    @fbButton.click
    FacebookLoginScreen.new
  end
  
  def login_email
    
  end
  
end
