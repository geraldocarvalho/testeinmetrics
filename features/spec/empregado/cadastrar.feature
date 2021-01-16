#language: pt

@cadastro
Funcionalidade: Validar a api de cadastro
  Para que eu possa realizar a contratação de um novo empregado
  Sendo um usuário do rh
  Posso cadastrar o empregado no sistema

  Esquema do Cenário: Validar o endpoint empregado_cadastrar.post
    Dado ter uma massa configurada do endpoint empregado_cadastrar.post para o cenário <tipo>
    Quando chamar o endpoint empregado_cadastrar.post
    Então validar o retorno do endpoint empregado_cadastrar.post para o cenário <tipo>

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |