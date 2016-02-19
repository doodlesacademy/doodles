class RemoveSetupFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :setup, :string
  end
end
