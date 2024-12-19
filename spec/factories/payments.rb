FactoryBot.define do
  factory :payment do
    name { "John Doe" }
    email { "johndoe@example.com" }
    cpf { "12345678909" }
    amount { 100.0 }
    status { "approved" }
    transaction_id { "txn_#{SecureRandom.hex(10)}" }
    payment_method { "credit_card" }
  end
end
