# spec/models/payment_spec.rb
require 'rails_helper'

require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:transaction_id) }

    it 'is invalid if amount is less than 1' do
      payment = Payment.new(amount: 0.99)
      expect(payment.valid?).to be_falsey
    end

    it 'is invalid if amount is greater than 99999.99' do
      payment = Payment.new(amount: 100_000)
      expect(payment.valid?).to be_falsey
    end

    it 'is invalid if cpf format is incorrect' do
      payment = Payment.new(cpf: '123')
      expect(payment.valid?).to be_falsey
    end
  end

  describe '.search_and_paginate' do
    it 'returns payments matching the query' do
      create(:payment, name: 'Angelo', email: 'angelo@example.com')
      results = Payment.search_and_paginate('angelo', 1)
      expect(results.count).to eq(1)
    end
  end
end

