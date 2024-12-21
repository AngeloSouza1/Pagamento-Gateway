class Payment < ApplicationRecord
  validates :name, :email, :amount, :status, :cpf, :transaction_id, presence: true

  # Validação para o campo 'amount' (valor a pagar)
  validates :amount, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 100_000.0, message: "deve estar entre R$1.00 e R$100,000.00" }

  # Validação para o formato do CPF
  validates :cpf, format: { with: /\A\d{11}\z/, message: "deve conter exatamente 11 dígitos" }

  # Validação adicional para garantir que o CPF seja válido
  validate :cpf_valido?

  # Método para busca e paginação
  def self.search_and_paginate(query, page, per_page = 10)
    if query.present?
      where("LOWER(name) LIKE ? OR LOWER(email) LIKE ?", 
            "%#{query.downcase}%", "%#{query.downcase}%")
      .order(created_at: :desc)
      .paginate(page: page, per_page: per_page)
    else
      order(created_at: :desc).paginate(page: page, per_page: per_page)
    end
  end

  private

  # Validação personalizada para CPF válido
  def cpf_valido?
    return if cpf.blank?

    unless cpf.match?(/\A\d{11}\z/) && cpf_nao_sequencial? && cpf_checksum_valido?
      errors.add(:cpf, "é inválido")
    end
  end

  # Verificar se o CPF não é uma sequência repetitiva (ex: 11111111111)
  def cpf_nao_sequencial?
    cpf.chars.uniq.length > 1
  end

  # Validação de checksum do CPF
  def cpf_checksum_valido?
    nums = cpf.chars.map(&:to_i)

    # Primeiro dígito verificador
    soma = nums[0..8].each_with_index.sum { |num, i| num * (10 - i) }
    primeiro_digito = (soma * 10 % 11) % 10

    # Segundo dígito verificador
    soma = nums[0..9].each_with_index.sum { |num, i| num * (11 - i) }
    segundo_digito = (soma * 10 % 11) % 10

    nums[9] == primeiro_digito && nums[10] == segundo_digito
  end
end
