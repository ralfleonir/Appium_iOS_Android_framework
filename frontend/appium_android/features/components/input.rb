class Input

  def initialize id
    @id = id
  end

  ### actions ###
  def type text
    AppWait.new.waitPresence(@id).send_keys text
  end

end
