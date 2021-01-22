Dado('ter uma massa configurada do endpoint alterar_cadastro.put para o cenário {tipo}') do |tipo|
  @post_body = gerar_massa_empregado
  @put_body = tipo.eql?('positivo') ? gerar_massa_empregado : {}.to_json
  @post_clients = Empregado.post('/cadastrar', body: @post_body)
  @parsed_post_response = JSON.parse(@post_clients.body)
end

Quando('chamar o endpoint alterar_cadastro.put') do
  @put_clients = Empregado.put("/alterar/#{@parsed_post_response['empregadoId']}", body: @put_body)
end

Entao('validar o retorno do endpoint alterar_cadastro.put para o cenário {tipo}') do |tipo|
  endpoint_request = JSON.parse(@put_body)
  endpoint_response = JSON.parse(@put_clients.body)
  if tipo.eql?('positivo')
    expect(@put_clients.code).to eql(200)
    expect(endpoint_response['salario']).to eql(endpoint_request['salario'])
    expect(endpoint_response['cpf']).to eql(endpoint_request['cpf'])
    expect(endpoint_response['cargo']).to eql(endpoint_request['cargo'])
    expect(endpoint_response['tipoContratacao']).to eql(endpoint_request['tipoContratacao'])
    expect(endpoint_response['comissao']).to eql(endpoint_request['comissao'])
    expect(endpoint_response['admissao']).to eql(endpoint_request['admissao'])
  else
    return_validations = ['tipoContratacao: must not be blank', 'comissao: must not be blank', 'nome: must not be blank', 'departamentoId: must not be null', 'salario: must not be blank', 'admissao: must not be blank', 'sexo: must not be blank', 'cargo: must not be blank', 'cpf: must not be blank']
    expect(@put_clients.code).to eql(400)
    expect(return_validations).to match_array(endpoint_response)
  end
end
