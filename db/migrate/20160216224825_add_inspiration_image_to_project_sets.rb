class AddInspirationImageToProjectSets < ActiveRecord::Migration
  def change
    add_column :project_sets, :inspiration_image, :string
  end
end
