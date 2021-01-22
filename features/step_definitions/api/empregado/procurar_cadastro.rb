Dado('ter uma massa configurada do endpoint procurar_cadastro.get para o cenário {tipo}') do |tipo|
  @body = gerar_massa_empregado
  @post_response = Empregado.post('/cadastrar', body: @body)
  @parsed_post_response = JSON.parse(@post_response.body)
  @parsed_post_response['empregadoId'] = rand(99_999_999) if tipo.eql?('negativo')
end

Quando('chamar o endpoint procurar_cadastro.get') do
  @put_clients = Empregado.get("/list/#{@parsed_post_response['empregadoId']}")
end

Entao('validar o retorno do endpoint procurar_cadastro.get para o cenário {tipo}') do |tipo|
  if tipo.eql?('positivo')
    expect(@put_clients.code).to eql(200)
    expect(@put_clients['empregadoId']).to eql(@parsed_post_response['empregadoId'])
    expect(@put_clients['nome']).to eql(@parsed_post_response['nome'])
    expect(@put_clients['sexo']).to eql(@parsed_post_response['sexo'])
    expect(@put_clients['cpf']).to eql(@parsed_post_response['cpf'])
    expect(@put_clients['cargo']).to eql(@parsed_post_response['cargo'])
    expect(@put_clients['admissao']).to eql(@parsed_post_response['admissao'])
    expect(@put_clients['salario']).to eql(@parsed_post_response['salario'])
    expect(@put_clients['comissao']).to eql(@parsed_post_response['comissao'])
    expect(@put_clients['tipoContratacao']).to eql(@parsed_post_response['tipoContratacao'])
  else
    expect(@put_clients.code).to eql(400)
    expect(@put_clients.body).to eql('Empregado não cadastrado')
  end
end
