#language: pt

@listar_cadastros
Funcionalidade: Validar a api de listagem de cadastros
  Sendo um usuário do rh
  Posso listar o cadastro de empregados no sistema

  Esquema do Cenário: Validar o endpoint listar_cadastros.get
    Quando ter acesso a lista de cadastros
    Então validar que a lista de cadastros é apresentada

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |