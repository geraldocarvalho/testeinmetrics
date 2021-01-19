Dado('ter uma massa configurada do endpoint empregado_deletar.delete para o cenário {tipo}') do |tipo|
    @body ={
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
      @resposta_post = HTTParty.post('https://inm-test-api.herokuapp.com/empregado/cadastrar', :headers => {'content-type': 'application/json'}, basic_auth: { username: 'inmetrics', password: 'automacao'}, :body => @body)
      @resposta = tipo.eql?('positivo') ? JSON.parse(@resposta_post.body) : '000'
  end

Quando('chamar o endpoint empregado_deletar.delete') do
  @delete_cadastro = HTTParty.delete "https://inm-test-api.herokuapp.com/empregado/deletar/#{@resposta['empregadoId']}",
  basic_auth: {
      username: 'inmetrics',
      password: 'automacao'
    }
end

Então('validar o retorno do endpoint empregado_deletar.delete para o cenário {tipo}') do |tipo|
  if tipo.eql?('positivo')
    expect(@delete_cadastro.body).to eq('Deletado')
    @resposta_delete = HTTParty.get("https://inm-test-api.herokuapp.com/empregado/list/#{@resposta['empregadoId']}", :headers => {'content-type': 'application/json'}, basic_auth: { username: 'inmetrics', password: 'automacao'})
    expect(@resposta_delete.body).to eq('Empregado não cadastrado')
    expect(@resposta_delete.code).to eq(400)
  else
    expect(@delete_cadastro['status']).to eq(404)
    expect(@delete_cadastro['error']).to eq('Not Found')
    expect(@delete_cadastro['message']).to eq('No message available')
  end
end