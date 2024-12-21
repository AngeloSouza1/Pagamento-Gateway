class AddCpfToPayments < ActiveRecord::Migration[7.2]
  def change
    add_column :payments, :cpf, :string
  end
end
