class AddDescriptionToProjectSet < ActiveRecord::Migration
  def change
    add_column :project_sets, :description, :string
  end
end
