class AddAnticipatedProblemsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :anticipated_problems, :text
  end
end
