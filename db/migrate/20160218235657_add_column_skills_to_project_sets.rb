class AddColumnSkillsToProjectSets < ActiveRecord::Migration
  def change
    add_column :project_sets, :skills, :text
  end
end
