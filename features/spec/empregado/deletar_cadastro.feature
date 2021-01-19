#language: pt

@deletar_cadastro
Funcionalidade: Validar a api de cadastro
  Para que eu possa realizar o desligamento de um empregado
  Sendo um usuário do rh
  Posso deletar o empregado no sistema

  Esquema do Cenário: Validar o endpoint empregado_deletar.delete
    Dado ter uma massa configurada do endpoint empregado_deletar.delete para o cenário <tipo>
    Quando chamar o endpoint empregado_deletar.delete
    Então validar o retorno do endpoint empregado_deletar.delete para o cenário <tipo>

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |