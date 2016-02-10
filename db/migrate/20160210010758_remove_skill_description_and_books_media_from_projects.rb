class RemoveSkillDescriptionAndBooksMediaFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :books_media
    remove_column :projects, :skills_description
  end
end
