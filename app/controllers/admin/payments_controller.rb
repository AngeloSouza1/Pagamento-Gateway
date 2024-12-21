class Admin::PaymentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @payments = Payment.search_and_paginate(params[:query], params[:page])

    if @payments.present?
      Rails.logger.info "Admin acessou a lista de pagamentos."
      Rails.logger.info "Total de pagamentos encontrados: #{@payments.count}"

      @payments.each do |payment|
        Rails.logger.info "Pagamento ID: #{payment.id}, Nome: #{payment.name}, Valor: #{payment.amount}, Status: #{payment.status}"
      end
    else
      Rails.logger.info "Nenhum pagamento encontrado."
    end
  end
end
