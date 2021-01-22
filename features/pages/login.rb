# frozen_string_literal: true

class Login < SitePrism::Page
  set_url :'https://inm-test-app.herokuapp.com/accounts/login/'

  element :input_usuario, '.input100[name="username"]'
  element :input_senha, '.input100[name="pass"]'
  element :btn_entre, '.login100-form-btn'
  element :btn_novo_empregado, "a[href='/empregados/new_empregado'"
  element :input_nome, '#inputNome'
  element :input_cargo, '#inputCargo'
  element :input_cpf, '#cpf'
  element :input_salario, '#dinheiro'
  element :select_sexo, '#slctSexo'
  element :input_admissao, '#inputAdmissao'
  element :btn_enviar_cadastro, '.cadastrar-form-btn'
  element :alerta_sucesso, '.alert'
  element :input_pesquisar, '#tabela_filter > label > input[type=search]'
  element :btn_editar_funcionario, '#tabela > tbody > tr > td:nth-child(6) > a:nth-child(2) > button'
  element :btn_deletar_funcionario, '#delete-btn'
  element :span_tabela_funcionarios, '.dataTables_empty'
  elements :lista_elementos, '#delete'
  element :cadastro_rh, '#navbarSupportedContent > ul > li:nth-child(1) > a'
  element :confirmar_senha, '.input100[name="confirmpass"]'
  element :usuario_rh_existente, 'body > div > div > div > form > div.p-t-10.p-b-1 > span > div'
  element :senha_rh_incorreta, 'body > div > div > div > form > div:nth-child(5) > span > div'

  def preencher_campos(tipo = 'correto')
    tipo.eql?('correto') ? input_usuario.set('Teste_01') : input_usuario.set('Teste_0101')
    tipo.eql?('correto') ? input_senha.set('123456') : input_senha.set('12345678')
    btn_entre.click
  end

  def cadastrar_rh
    user = Time.now.to_i
    input_usuario.set("Rh#{user}")
    input_senha.set("Rh#{user}".reverse)
    confirmar_senha.set("Rh#{user}".reverse)
    btn_entre.click
    input_usuario.set("Rh#{user}")
    input_senha.set("Rh#{user}".reverse)
    btn_entre.click
  end

  def cadastro_rh_existente
    input_usuario.set('Teste_01')
    input_senha.set('123456')
    confirmar_senha.set('123456')
    btn_entre.click
  end

  def cadastro_rh_senha_incorreta
    user = Time.now.to_i
    input_usuario.set("Rh#{user}")
    input_senha.set("Rh#{user}".reverse)
    confirmar_senha.set("Rh#{user}")
    btn_entre.click
  end

  def cadastrar_usuario(massa)
    btn_novo_empregado.click unless URI.parse(current_url).path.include?('edit')
    input_nome.set(massa['nome'])
    input_cargo.set(massa['cargo'])
    input_cpf.set(massa['cpf'])
    input_salario.set(massa['salario'])
    select(validar_sexo(massa['sexo']), from: 'slctSexo')
    input_admissao.set(massa['admissao'])
    massa['tipoContratacao'].eql?('clt') ? choose('clt') : choose('pj')
    btn_enviar_cadastro.click
  end

  def validar_sexo(sexo)
    case sexo
    when 'm'
      'Masculino'
    when 'f'
      'Feminino'
    else
      'Indiferente'
    end
  end

  def localizar_funcionario(cpf)
    input_pesquisar.set(cpf)
  end

  def editar_funcionario(massa)
    btn_editar_funcionario.click
    cadastrar_usuario(massa)
  end

  def deletar_funcionario
    btn_deletar_funcionario.click
  end
end
