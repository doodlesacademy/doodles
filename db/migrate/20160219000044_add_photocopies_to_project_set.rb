class AddPhotocopiesToProjectSet < ActiveRecord::Migration
  def change
    add_column :project_sets, :photocopies, :text
  end
end
