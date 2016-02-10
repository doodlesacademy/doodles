class AddSlugToProjectSet < ActiveRecord::Migration
  def change
    add_column :project_sets, :slug, :string
  end
end
