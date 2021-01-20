Dado('ter uma massa configurada do endpoint empregado_deletar.delete para o cenário {tipo}') do |tipo|
  @body = gerar_massa_empregado
  @post_clients = Empregado.post('/cadastrar', body: @body)
  @parsed_post_response = tipo.eql?('positivo') ? JSON.parse(@post_clients.body) : '000'
end

Quando('chamar o endpoint empregado_deletar.delete') do
  @delete_clients = Empregado.delete("/deletar/#{@parsed_post_response['empregadoId']}")
end

Entao('validar o retorno do endpoint empregado_deletar.delete para o cenário {tipo}') do |tipo|
  if tipo.eql?('positivo')
    expect(@delete_clients.code).to eql(204)
    expect(@delete_clients.body).to eql('Deletado')
    @get_response = Empregado.get("/list/#{@parsed_post_response['empregadoId']}")
    expect(@get_response.code).to eql(400)
    expect(@get_response.body).to eql('Empregado não cadastrado')
  else
    expect(@delete_clients['status']).to eql(404)
    expect(@delete_clients['error']).to eql('Not Found')
    expect(@delete_clients['message']).to eql('No message available')
  end
end
