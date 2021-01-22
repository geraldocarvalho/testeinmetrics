Dado('ter uma massa configurada do endpoint cadastrar_empregado.post para o cenário {tipo}') do |tipo|
  @body = tipo.eql?('positivo') ? gerar_massa_empregado : {}.to_json
end

Quando('chamar o endpoint cadastrar_empregado.post') do
  @post_clients = Empregado.post('/cadastrar', body: @body)
end

Entao('validar o retorno do endpoint cadastrar_empregado.post para o cenário {tipo}') do |tipo|
  endpoint_request = JSON.parse(@body)
  endpoint_response = JSON.parse(@post_clients.body)
  if tipo.eql?('positivo')
    expect(@post_clients.code).to eql(200)
    expect(endpoint_response['empregadoId']).to be_positive
    expect(endpoint_response['nome']).to eql(endpoint_request['nome'])
    expect(endpoint_response['sexo']).to eql(endpoint_request['sexo'])
    expect(endpoint_response['cpf']).to eql(endpoint_request['cpf'])
    expect(endpoint_response['cargo']).to eql(endpoint_request['cargo'])
    expect(endpoint_response['admissao']).to eql(endpoint_request['admissao'])
    expect(endpoint_response['salario']).to eql(endpoint_request['salario'])
    expect(endpoint_response['comissao']).to eql(endpoint_request['comissao'])
    expect(endpoint_response['tipoContratacao']).to eql(endpoint_request['tipoContratacao'])
  else
    return_validations = ['tipoContratacao: must not be blank', 'comissao: must not be blank', 'nome: must not be blank', 'departamentoId: must not be null', 'salario: must not be blank', 'admissao: must not be blank', 'sexo: must not be blank', 'cargo: must not be blank', 'cpf: must not be blank']
    expect(@post_clients.code).to eql(400)
    expect(return_validations).to match_array(endpoint_response)
  end
end
