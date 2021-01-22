#language: pt

@acesso_rh
Funcionalidade: Funções de funcionário
  Para que eu possa administrar os funcionários da inmetrics
  Sendo um usuário previamente cadastrado
  Posso cadastrar, editar e deletar funcionários do sistema

  @cadastro_funcionario
  Cenário: cadastro_funcionario
    Dado que eu esteja na página home
    Quando realizo o acesso da página de login
    E cadastro novo funcionário
    Então verifico que o funcionário novo foi cadastrado
