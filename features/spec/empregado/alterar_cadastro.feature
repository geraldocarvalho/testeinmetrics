#language: pt

@alterar_cadastro
Funcionalidade: Validar a api de edição de cadastro
  Para que eu possa realizar a edição de um cadastro de um empregado
  Sendo um usuário do rh
  Posso editar o empregado no sistema

  Esquema do Cenário: Validar o endpoint alterar_cadastro.put
    Dado ter uma massa configurada do endpoint alterar_cadastro.put para o cenário <tipo>
    Quando chamar o endpoint alterar_cadastro.put
    Então validar o retorno do endpoint alterar_cadastro.put para o cenário <tipo>

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |