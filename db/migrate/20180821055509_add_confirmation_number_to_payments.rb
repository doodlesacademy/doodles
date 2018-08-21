class AddConfirmationNumberToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :confirmation_number, :string
  end
end
