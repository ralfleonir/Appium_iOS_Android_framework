class WelcomeScreen < BasePage

  ### Trait ###
  def trait; @connect_button_id; end

  ### Elements ids ###
  def initialize
    @connect_button_id = ""
    @compatible_button_id = ""
  end

  ### actions ###
  def click_connect_car_button
    Button.new(@connect_button_id).click
    # Should return next screen
  end

  def click_see_compatible_button
    Button.new(@compatible_button_id).click
    # Should return next screen
  end

end
