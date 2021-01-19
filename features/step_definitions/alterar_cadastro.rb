Dado('ter uma massa configurada do endpoint alterar_cadastro.put para o cenário {tipo}') do |tipo|
  @body = {
      "admissao": "01/01/1990",
      "cargo": "Assistente",
      "comissao": "500,00",
      "cpf": "219.862.750-00",
      "departamentoId": 1,
      "nome": "Teste_01",
      "salario": "1.000,00",
      "sexo": "m",
      "tipoContratacao": "clt"
  }.to_json
  if tipo.eql?('positivo')
    @body_alterado = {
        "admissao": "10/10/2000",
        "cargo": "Assistente Jr",
        "comissao": "1.500,00",
        "cpf": "000.862.750-00",
        "departamentoId": 1,
        "nome": "Teste_01",
        "salario": "2.000,00",
        "sexo": "m",
        "tipoContratacao": "pj"
    }.to_json
  else
    @body_alterado = {
      "departamentoId": 1
    }.to_json
  end
    @resposta_post = HTTParty.post('https://inm-test-api.herokuapp.com/empregado/cadastrar', :headers => {'content-type': 'application/json'}, basic_auth: { username: 'inmetrics', password: 'automacao'}, :body => @body)
    puts @resposta_post.code, @resposta_post.body
end

Quando('chamar o endpoint alterar_cadastro.put') do
  resposta_post = JSON.parse(@resposta_post.body)
  @resposta_put = HTTParty.put "https://inm-test-api.herokuapp.com/empregado/alterar/#{resposta_post['empregadoId']}",
  basic_auth: {
      username: 'inmetrics',
      password: 'automacao'
    },
  :body => @body_alterado,
  :headers => {"Content-Type" => 'application/json'}
end

Então('validar o retorno do endpoint alterar_cadastro.put para o cenário {tipo}') do |tipo|
  if tipo.eql?('positivo')
    body_alterado = JSON.parse(@body_alterado)
    resposta_api = JSON.parse(@resposta_put.body)
    expect(resposta_api['salario']).to eq(body_alterado['salario'])
    expect(resposta_api['cpf']).to eq(body_alterado['cpf'])
    expect(resposta_api['cargo']).to eq(body_alterado['cargo'])
    expect(resposta_api['tipoContratacao']).to eq(body_alterado['tipoContratacao'])
    expect(resposta_api['comissao']).to eq(body_alterado['comissao'])
    expect(resposta_api['admissao']).to eq(body_alterado['admissao'])
    expect(@resposta_put.code).to eq 200
  else
    resposta_correta = ['tipoContratacao: must not be blank', 'comissao: must not be blank', 'nome: must not be blank', 'salario: must not be blank', 'admissao: must not be blank', 'sexo: must not be blank', 'cargo: must not be blank', 'cpf: must not be blank']
    resposta = JSON.parse(@resposta_put.body)
    expect(resposta_correta).to match_array(resposta)
  end
end