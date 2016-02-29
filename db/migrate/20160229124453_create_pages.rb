class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :content
      t.string :slug
      t.integer :status
      t.string :title

      t.timestamps null: false
    end
  end
end
