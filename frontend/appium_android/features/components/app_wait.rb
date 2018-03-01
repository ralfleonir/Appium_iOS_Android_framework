class AppWait

  def waitPresence id
    wait = Selenium::WebDriver::Wait.new(timeout: Integer(ENV["timeout"]))
    wait.until { find_element(:id, id) }
  end

end
