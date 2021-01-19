Dado('ter uma massa configurada do endpoint cadastrar_empregado.post para o cenário {tipo}') do |tipo|
  if tipo.eql?('positivo')
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
  else
    @body ={}.to_json
  end
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
    expect(@post_clients.code).to eq 200
  else
    resposta = JSON.parse(@post_clients.body)
    resposta_correta = ['tipoContratacao: must not be blank', 'comissao: must not be blank', 'nome: must not be blank', 'departamentoId: must not be null', 'salario: must not be blank', 'admissao: must not be blank', 'sexo: must not be blank', 'cargo: must not be blank', 'cpf: must not be blank']
    puts resposta
    puts @post_clients.message
    expect(@post_clients.code).to eq 400
    expect(resposta_correta).to match_array(resposta)
  end
end

