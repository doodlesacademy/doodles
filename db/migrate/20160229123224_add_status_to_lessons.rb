class AddStatusToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :status, :integer, default: 0
  end
end
