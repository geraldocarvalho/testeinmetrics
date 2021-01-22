module Empregado
  include HTTParty
  base_uri 'https://inm-test-api.herokuapp.com/empregado'
  format :json
  headers 'Content-Type': 'application/json'
  basic_auth 'inmetrics', 'automacao'
end
