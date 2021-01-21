#language: pt

@login
Funcionalidade: Login
  Para que eu possa acessar o sistema da inmetrics
  Sendo um usuário previamente cadastrado
  Posso acessar o sistema ao realizar o login

Contexto:
Dado que eu esteja na página home
Quando realizo o acesso da página de login

  @login_sucesso
  Cenário: login com sucesso
    E preencho as informações de login corretamente
    Entao verifico que estou logado com sucesso

  Esquema do Cenário: Acesso via login
  E preencho com as informações incorretas "<tipo>"
  Entao verifico que houve uma falha de "<comportamento>"

    @login_falha
    Exemplos:
    | tipo              | comportamento    |
    | usuario_incorreto | usuario_invalido |
    | senha_incorreta   | senha_invalida   |
    | sem_senha         | senha_ausente    |
