#language: pt

@login
Funcionalidade: Login
  Para que eu possa acessar o sistema da inmetrics
  Sendo um usuário previamente cadastrado
  Posso acessar o sistema ao realizar o login

Contexto:
Dado que eu esteja na página home

  @login_sucesso
  Cenário: login com sucesso
    Quando preencho os dados de login
    Entao verifico que estou logado com sucesso

  Esquema do Cenário: Acesso via login
    Quando preencho com as informações incorretas "<tipo>"
    Entao verifico que houve uma falha de "<comportamento>"

    @login_falha
    Exemplos:
      | tipo              | comportamento    |
      | usuario_incorreto | usuario_invalido |
      | senha_incorreta   | senha_invalida   |
