class WelcomeScreen < BasePage

  attr_reader :conect_your_car_button
  
  def initialize
   wait { @conect_your_car_button = find_exact('Conecte seu carro') }
  end

  def select_conecte_seu_carro
  	@conect_your_car_button.click
  end
    
end
