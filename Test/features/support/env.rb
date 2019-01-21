require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'rspec'
require 'faker'
require 'ostruct'
require 'site_prism'
require_relative 'page_helper.rb'
require_relative 'helper.rb'


#Global variables#
World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)
World(Helper)

#Enviroment Variable#
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']

#Browser Variable#
BROWSER = ENV['BROWSER']


#Variable to choose the environment#
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yml")

#Configure the browser#
Capybara.register_driver :selenium do |app|
    if BROWSER.eql?('chrome')
      Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
          'chromeOptions' => { 'args' => ['--start-maximized',
                                          '--disable-infobars'] }
        )
      )
    elsif BROWSER.eql?('firefox')
      Capybara::Selenium::Driver.new(
        app,
        browser: :firefox,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities
          .firefox(marionette: true)
      )
    end
  end

  #Configurate the principal url#
  Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = CONFIG['url']
  end

  #Configure max wait time
  Capybara.default_max_wait_time = 10