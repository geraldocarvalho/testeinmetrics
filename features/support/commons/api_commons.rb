module ApiCommons
  def gerar_cpf
    BRDocuments::CPF.generate
  end

  def gerar_nome_completo
    "#{Faker::Name.first_name} #{Faker::Name.middle_name} #{Faker::Name.last_name}"
  end

  def gerar_email
    Faker::Internet.email
  end

  def gerar_data(days = 0, mask = '%d/%m/%Y', utc: false)
    ((utc ? Time.now.utc : Time.now).to_date + days).strftime(mask)
  end

  def gerar_massa_empregado
    {
      'admissao': gerar_data,
      'cargo': %w[Assistente Caixa Estoquista Gerente].sample,
      'comissao': "#{rand(100..999)},#{rand(10..99)}",
      'cpf': gerar_cpf,
      'departamentoId': 1,
      'nome': gerar_nome_completo,
      'salario': "#{rand(1..9)}.#{rand(100..999)},#{rand(10..99)}",
      'sexo': %w[m f i].sample,
      'tipoContratacao': %w[clt pj].sample
    }.to_json
  end
end
