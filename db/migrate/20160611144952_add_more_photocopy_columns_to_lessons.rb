class AddMorePhotocopyColumnsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :first_photocopy_header, :text
    add_column :lessons, :second_photocopy_header, :text
    add_column :lessons, :third_photocopy_header, :text
  end
end
