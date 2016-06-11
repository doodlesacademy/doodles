class AddMaterialsSuggestionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :materials_suggestion, :text
  end
end
