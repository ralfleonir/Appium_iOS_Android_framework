class ChassisScreen < BasePage

  attr_reader :chassis_field
  
  def initialize
   wait { @chassis_field = find('Digitar o') }
  end

  def select_type_chassis_number_button
  	@chassis_field.click
  end

  def type_chassis_number (chassi_numer)
  	textfield('chassi').type(chassi_numer)
  end
    
end
