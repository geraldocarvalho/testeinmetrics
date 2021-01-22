Quando('cadastro novo funcionário') do
  @massa = JSON.parse(gerar_massa_empregado)
  @login.windows[0].maximize
  @login.cadastrar_usuario(@massa)
end

Entao('verifico que o funcionário novo foi cadastrado') do
  expect(@login.alerta_sucesso.text).to include('SUCESSO! Usuário cadastrado com sucesso')
end

Quando('localizo o funcionário pelo CPF') do
  @login.localizar_funcionario(@massa['cpf'])
end

Quando('edito os campos do funcionário') do
  @nova_massa = JSON.parse(gerar_massa_empregado)
  @login.editar_funcionario(@nova_massa)
end

Entao('verifico que o funcionário foi alterado') do
  expect(@login.alerta_sucesso.text).to include('SUCESSO! Informações atualizadas com sucesso')
end

Quando('excluo o funcionário') do
  @login.deletar_funcionario
  expect(@login.alerta_sucesso.text).to include('SUCESSO! Funcionário removido com sucesso')
end

Entao('verifico que o funcionário não existe no sistema') do
  @login.localizar_funcionario(@massa['cpf'])
  expect(@login.span_tabela_funcionarios.text).to eql('Nenhum registro encontrado')
end
