class RemoveRedundantColumnsFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :synopsis, :string
    remove_column :lessons, :objective, :string
    remove_column :lessons, :setup, :string
    remove_column :lessons, :photocopies, :string
    remove_column :lessons, :media, :string
    remove_column :lessons, :anticipated_problems, :string
    remove_column :lessons, :early_finishers, :string
  end
end
