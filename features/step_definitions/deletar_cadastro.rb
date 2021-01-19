Dado('ter uma massa configurada do endpoint empregado_deletar.delete para o cenário {tipo}') do |tipo|
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
      @resposta_post = HTTParty.post('https://inm-test-api.herokuapp.com/empregado/cadastrar', :headers => {'content-type': 'application/json'}, basic_auth: { username: 'inmetrics', password: 'automacao'}, :body => @body)
      puts @resposta_post.code, @resposta_post.body
  end

Quando('chamar o endpoint empregado_deletar.delete') do
  resposta_post = JSON.parse(@resposta_post.body)
  @delete_cadastro = HTTParty.delete "https://inm-test-api.herokuapp.com/empregado/deletar/#{resposta_post['empregadoId']}",
  basic_auth: {
      username: 'inmetrics',
      password: 'automacao'
    },
  :body => @body,
  :headers => {"Content-Type" => 'application/json'}
end

Então('validar o retorno do endpoint empregado_deletar.delete para o cenário {tipo}') do |tipo|
  expect(@delete_cadastro.code).to eq 202
end