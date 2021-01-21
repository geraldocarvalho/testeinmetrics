# frozen_string_literal: true

class Login < SitePrism::Page
  set_url :'https://inm-test-app.herokuapp.com/accounts/login/'

  element :input_usuario, '.input100', match: :first
  element :input_senha, '.input100', match:
  element :btn_entre, '.login100-form-btn'

  def preencher_usuario(tipo = 'correto')
    tipo.eql?('correto') ? input_usuario.set('Teste_01') : input_usuario.set('Teste_0101')
  end

  def preencher_senha(tipo = 'correta')
    page.execute_script(script)

    binding.pry
    tipo.eql?('correta') ? input_senha.set('123456') : input_senha.set('12345678')
  end

  def click_logar
    btn_entre.click
  end
end
