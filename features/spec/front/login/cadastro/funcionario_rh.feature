#language: pt

@cadastro_rh
Funcionalidade: Cadastro de funcionário do rh
  Para que eu possa administrar os funcionários da inmetrics
  Sendo um usuário não cadastrado
  Posso me cadastrar sistema do rh da inmetrics

  @cadastro_funcionario_rh
  Cenário: cadastro_funcionario_rh
    Dado que eu esteja na página home
    Quando clico na opção de cadastre-se
    E cadastro novo funcionário do rh
    Entao verifico que o novo funcionário foi cadastrado

  @cadastro_funcionario_rh_existente
  Cenário: cadastro_funcionario_rh_existente
    Dado que eu esteja na página home
    Quando clico na opção de cadastre-se
    E cadastro um funcionário do rh existente
    Entao verifico que o funcionário do rh não foi cadastrado

  @cadastro_funcionario_rh_senha_incorreta
  Cenário: cadastro_funcionario_rh_senha_incorreta
    Dado que eu esteja na página home
    Quando clico na opção de cadastre-se
    E cadastro um funcionário do rh com a confirmação de senha incorreta
    Entao verifico que a senha está incorreta
