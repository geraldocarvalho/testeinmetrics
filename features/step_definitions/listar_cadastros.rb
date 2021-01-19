Quando('ter acesso a lista de cadastros') do
  @listar_cadastros = HTTParty.get "https://inm-test-api.herokuapp.com/empregado/list_all",
  basic_auth: {
      username: 'inmetrics',
      password: 'automacao'
    },
  :body => @body,
  :headers => {"Content-Type" => 'application/json'}
end

Então('validar que a lista de cadastros é apresentada') do
binding.pry
expect(@listar_cadastros.code).to eq 200
expect(@listar_cadastros).not_to be_empty
end