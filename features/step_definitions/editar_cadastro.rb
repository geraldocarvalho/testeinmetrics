Dado('ter uma massa configurada do endpoint editar_cadastro.put para o cenário {tipo}') do |tipo|
  @body ={
      "admissao": "01/01/1990",
      "cargo": "Assistente",
      "comissao": "500,00",
      "cpf": "219.862.750-00", #criar metodo de cpf aleatorio
      "departamentoId": 1,
      "nome": "Teste_01",
      "salario": "1.000,00",
      "sexo": "m",
      "tipoContratacao": "clt"
    }.to_json
    @respota_post = HTTParty.post('https://inm-test-api.herokuapp.com/empregado/cadastrar', :headers => {'content-type': 'application/json'}, basic_auth: { username: 'inmetrics', password: 'automacao'}, :body => @body)
    puts @respota_post.code, @respota_post.body
end

Quando('chamar o endpoint editar_cadastro.put') do
  resposta_post = JSON.parse(@respota_post.body)
  @put_clients = HTTParty.put "https://inm-test-api.herokuapp.com/empregado/alterar/#{resposta_post['empregadoId']}",
  basic_auth: {
      username: 'inmetrics',
      password: 'automacao'
    },
  :body => @body,
  :headers => {"Content-Type" => 'application/json'}
end

Então('validar o retorno do endpoint editar_cadastro.put para o cenário {tipo}') do |tipo|
  expect(@put_clients.code).to eq 202
end