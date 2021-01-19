#language: pt

@procurar_cadastro
Funcionalidade: Validar a api de localização de cadastro
  Para que eu possa realizar a localização de um cadastro de um empregado
  Sendo um usuário do rh
  Posso localizar o empregado no sistema

  Esquema do Cenário: Validar o endpoint procurar_cadastro.get
    Dado ter uma massa configurada do endpoint procurar_cadastro.get para o cenário <tipo>
    Quando chamar o endpoint procurar_cadastro.get
    Então validar o retorno do endpoint procurar_cadastro.get para o cenário <tipo>

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |