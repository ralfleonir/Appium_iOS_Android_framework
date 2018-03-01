require "appium_lib"
require "pry"

ENV['timeout'] = "3" # seconds

def caps
	{ caps: {
			deviceName: "DeviceNameHere",
			platformName: "Android",
			appActivity: 'com.fcagroup.app.android.view.LoginActivity',
			appPackage: 'com.fcagroup.app.android',
			newCommandTimeout: "3600",
			appium_lib: {
				wait: 20,
				debug: false
			}
		}
	}
end

$driver = Appium::Driver.new(caps)
Appium.promote_appium_methods Object
