class AddInspirationImageDescriptionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :inspiration_image_description, :string
  end
end
