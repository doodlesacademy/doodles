class AddCoreContentToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :core_content, :text
  end
end
