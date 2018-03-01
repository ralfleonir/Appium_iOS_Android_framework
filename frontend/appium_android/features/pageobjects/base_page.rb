class BasePage

  MESS = "PROGRAMMING ERROR: method missing"

  def initialize
    AppWait.new.waitPresence(trait)
  end

  def trait; raise MESS; end

end
