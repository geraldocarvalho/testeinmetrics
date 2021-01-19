module Empregado
  include HTTParty
  base_uri 'https://inm-test-api.herokuapp.com'
  format :json
end