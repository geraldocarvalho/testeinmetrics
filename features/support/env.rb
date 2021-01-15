require 'selenium-webdriver'
require 'rspec'
require 'httparty'


Capybara.configure do |config|
  config.default_driver = :selenium_chrome
end
