class AddFoundationsDropdownsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :engage_ny, :text
    add_column :projects, :next_gen_sci, :text
  end
end
