class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :school
      t.string :city
      t.string :state
      t.string :country
      t.string :occupation
      t.string :grades
      t.timestamps null: false
    end
  end
end
