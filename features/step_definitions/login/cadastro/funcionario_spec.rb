Quando('cadastro novo funcionário') do
  @massa = JSON.parse(gerar_massa_empregado)
  @login.cadastrar_usuario(@massa)
end

Então('verifico que o funcionário novo foi cadastrado') do
  binding.pry
end