class Button

  def initialize id
    @id = id
  end

  ### actions ###
  def click
    AppWait.new.waitPresence(@id).click
  end

end
