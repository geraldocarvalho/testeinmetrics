#language: pt

@cadastro
Funcionalidade: Validar a api de cadastro
  Para que eu possa realizar a contratação de um novo empregado
  Sendo um usuário do rh
  Posso cadastrar o empregado no sistema

  Esquema do Cenário: Validar o endpoint cadastrar_empregado.post
    Dado ter uma massa configurada do endpoint cadastrar_empregado.post para o cenário <tipo>
    Quando chamar o endpoint cadastrar_empregado.post
    Então validar o retorno do endpoint cadastrar_empregado.post para o cenário <tipo>

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |