class LoginEmailScreen < BasePage

  ### Trait ###
  def trait; @field_input_id; end

  ### Elements finders ###
  def initialize
    @field_input_id = ""
    @next_button_id = ""
  end

  ### actions ###
  def type_email text
    Input.new(@field_input_id).type text
  end

  def click_next
    Button.new(@next_button_id).click
    #Should return next screen
  end

end
