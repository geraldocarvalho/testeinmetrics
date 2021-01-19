Dado('ter uma massa configurada do endpoint cadastrar_empregado.post para o cenário {tipo}') do |tipo|
  @body ={
    "admissao": "01/01/1990",
    "cargo": "Assistente",
    "comissao": "500,00",
    "cpf": "219.862.750-78", #criar metodo de cpf aleatorio
    "departamentoId": 1,
    "nome": "Teste_01",
    "salario": "1.000,00",
    "sexo": "m",
    "tipoContratacao": "clt"
  }.to_json
  end

Quando('chamar o endpoint cadastrar_empregado.post') do
  @post_clients = HTTParty.post 'https://inm-test-api.herokuapp.com/empregado/cadastrar',
  basic_auth: {
      username: 'inmetrics',
      password: 'automacao'
    },
  :body => @body,
  :headers => {"Content-Type" => 'application/json'}
end

Então('validar o retorno do endpoint cadastrar_empregado.post para o cenário {tipo}') do |tipo|
  if tipo.eql?('positivo')
    puts @post_clients.body
    puts @post_clients.message
    #response = HTTParty.post('https://inm-api-test.herokuapp.com/empregado/cadastrar', :body => @body, :debug_output => $stdout)
    expect(@post_clients.code).to eq 202
  else
    puts 'Negativo!'
  end
end

