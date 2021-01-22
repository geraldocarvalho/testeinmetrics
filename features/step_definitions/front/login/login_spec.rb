# frozen_string_literal: true

Dado('que eu esteja na página home') do
  @login = Login.new
  @login.load
end

Quando('preencho os dados de login') do
  @login.preencher_campos
end

Entao('verifico que estou logado com sucesso') do
  expect(page.has_text?('Mostrando os registros de 1 a 8 de um total de')).to be_truthy
  expect(page).to have_content 'Pesquisar'
end

Quando('preencho com as informações incorretas {string}') do |_tipo|
  @login.preencher_campos('incorreto')
end

Entao('verifico que houve uma falha de {string}') do |comportamento|
  if comportamento.eql?('usuario_invalido' || 'senha_invalida')
    expect(page.find('.alert').visible?).to be_truthy
    expect(page.find('.alert').text).to include('ERRO! Usuário ou Senha inválidos')
  end
end
