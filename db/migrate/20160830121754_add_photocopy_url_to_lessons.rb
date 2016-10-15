class AddPhotocopyUrlToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :first_photocopy_url, :text
    add_column :lessons, :second_photocopy_url, :text
  end
end
