#language: pt

@editar_cadastro
Funcionalidade: Validar a api de edição de cadastro
  Para que eu possa realizar a edição de um cadastro de um empregado
  Sendo um usuário do rh
  Posso editar o empregado no sistema

  Esquema do Cenário: Validar o endpoint editar_cadastro.put
    Dado ter uma massa configurada do endpoint editar_cadastro.put para o cenário <tipo>
    Quando chamar o endpoint editar_cadastro.put
    Então validar o retorno do endpoint editar_cadastro.put para o cenário <tipo>

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |