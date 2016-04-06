class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :involvement
      t.text :message
      t.boolean :subscribe, default: true

      t.timestamps null: false
    end
  end
end
