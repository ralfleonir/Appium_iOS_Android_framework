require 'appium_lib'
require 'appium_console'
require 'pry'
require 'singleton'
require 'rspec/expectations'

class Driver
  include Singleton

# allows only one driver instance
  def initialize
        @driver = Appium::Driver.new(self.caps)
        # to do: refectory this object
        Appium.promote_appium_methods Object
  end

def caps
	{ caps: { 
        automationName: 'XCUITest',
        platformName: 'iOS',
        bundleId: 'com.fcagroup.app.FCA',
        deviceName:'ACiPhone6',
        udid: '07b2e998141a0909280b81d96a849fe92ae60d5b',
        platformVersion: '10.2.1',
        nativeWebTap: true,
        autoAcceptAlerts: false,

	  appium_lib: { wait: 10,
	  		debug: false
	  			  }
	        }
	}
end

  def driver
    @driver
  end
end

