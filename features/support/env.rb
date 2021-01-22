require 'selenium-webdriver'
require 'rspec'
require 'httparty'
require 'capybara'
require 'pry'
require 'faker'
require 'br_documents'
require 'capybara/cucumber'
require 'site_prism'

require_relative '../services/empregado_service'
require_relative '../support/commons/api_commons'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'http://www.inmrobo.tk/accounts/login/'
end

ParameterType(
  name: 'tipo',
  regexp: /positivo|negativo|validacao/,
  transformer: ->(type) { type }
)

World(ApiCommons) # Permite que os metodos dentro do arquivo api_commons sejam utilizados em qualquer arquivo .rb
