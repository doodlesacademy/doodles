class RenameSetUpToSetupOfLessons < ActiveRecord::Migration
  def change
    rename_column :lessons, :set_up, :setup
  end
end
