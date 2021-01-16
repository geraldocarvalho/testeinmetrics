require 'selenium-webdriver'
require 'rspec'
require 'httparty'
require 'capybara'
require 'pry'

require_relative '../services/empregado_service.rb'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'http://www.inmrobo.tk/accounts/login/'
end

ParameterType(
  name: 'tipo',
  regexp: /positivo|negativo|validacao/,
  transformer: ->(type) { type }
)