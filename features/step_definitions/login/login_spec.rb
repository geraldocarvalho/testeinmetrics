# frozen_string_literal: true

Dado('que eu esteja na página home') do
  @login = Login.new
  @login.load
end

Quando('realizo o acesso da página de login') do
  @login.preencher_usuario
  @login.preencher_senha
  @login.click_logar
end

Entao('verifico que estou logado com sucesso') do
end
