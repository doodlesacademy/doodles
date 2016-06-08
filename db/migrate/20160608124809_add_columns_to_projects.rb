class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :materials, :text
    add_column :projects, :books_media, :text
    add_column :projects, :common_core, :text
    add_column :projects, :national_core, :text
    add_column :projects, :art_elements, :text
    add_column :projects, :art_principles, :text
    add_column :projects, :cross_curricular, :text
  end
end
