Quando('clico na opção de cadastre-se') do
  @login.cadastro_rh.click
end

E('cadastro novo funcionário do rh') do
  @login.cadastrar_rh
end

Entao('verifico que o novo funcionário foi cadastrado') do
  expect(page.has_text?('Mostrando os registros de 1 a 8 de um total de')).to be_truthy
  expect(page).to have_content 'Pesquisar'
end

Quando('cadastro um funcionário do rh existente') do
  @login.cadastro_rh_existente
end

Quando('cadastro um funcionário do rh com a confirmação de senha incorreta') do
  @login.cadastro_rh_senha_incorreta
end

Entao('verifico que o funcionário do rh não foi cadastrado') do
  expect(@login.usuario_rh_existente.text).to eql('Usuário já cadastrado')
end

Entao('verifico que a senha está incorreta') do
  expect(@login.senha_rh_incorreta.text).to eql('Senhas não combinam')
end
