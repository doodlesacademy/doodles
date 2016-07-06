class AddMaterialsNoteToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :materials_note, :text
  end
end
