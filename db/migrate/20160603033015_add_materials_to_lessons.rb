class AddMaterialsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :materials, :string
  end
end
