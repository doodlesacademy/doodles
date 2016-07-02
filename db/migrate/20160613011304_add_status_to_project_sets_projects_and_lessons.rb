class AddStatusToProjectSetsProjectsAndLessons < ActiveRecord::Migration
  def change
    add_column :project_sets, :status, :integer, default: 0
    add_column :projects, :status, :integer, default: 0
  end
end
