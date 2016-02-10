class AddSkillDescriptionAndBooksMediaToProjectSets < ActiveRecord::Migration
  def change
    add_column :project_sets, :books_media, :string
    add_column :project_sets, :skills_description, :string
  end
end
