class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user, null: true
      t.string :stripe_email, null: false
      t.integer :amount, null: false

      t.timestamps null: false
    end

    create_table :payments_products do |t|
      t.references :payment
      t.references :product
    end
  end
end
