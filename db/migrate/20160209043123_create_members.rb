class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :avatar_url

      t.timestamps null: false
    end
  end
end
