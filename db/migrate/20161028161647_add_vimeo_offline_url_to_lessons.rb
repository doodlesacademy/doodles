class AddVimeoOfflineUrlToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :vimeo_offline_url, :text
  end
end
