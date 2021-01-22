Quando('ter acesso a lista de cadastros') do
  @listar_cadastros = Empregado.get('/list_all')
end

Entao('validar que a lista de cadastros é apresentada') do
  expect(@listar_cadastros.code).to eql(200)
  expect(@listar_cadastros).not_to be_empty
  expect(@listar_cadastros.all? { |empregado| empregado.each_value { |campos_obrigatorios| expect(campos_obrigatorios).not_to be_nil } }).to be_truthy
end
