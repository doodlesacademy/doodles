class AddSetupToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :setup, :text
  end
end
