class AddSettingUpToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :setting_up, :text
  end
end
