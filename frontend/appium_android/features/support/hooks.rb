Before do
	$driver.start_driver
end

After do |scenario|
	# take screenshot on error
	# create "screenshot directory if does not exist"
	unless File.directory?("screenshots")
		FileUtils.mkdir_p("screenshots")
	end
    # create the screenshot file
    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    file_name = "#{time_stamp}.png"
    screenshot_name = File.join("screenshots", file_name)
    # take the screenshot
    $driver.screenshot(screenshot_name)
    #attach the screenshot to report
    embed("#{screenshot_name}", "image/png")

    $driver.driver_quit
end

AfterConfiguration do
	# remove screenshots directory before tests
	FileUtils.rm_r("screenshots") if File.directory?("screenshots")
end
