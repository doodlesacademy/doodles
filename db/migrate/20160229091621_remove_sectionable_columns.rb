class RemoveSectionableColumns < ActiveRecord::Migration
  def change
    remove_column :projects, :synopsis
    remove_column :projects, :books_media
    remove_column :projects, :skills
    remove_column :projects, :photocopies

    remove_column :standards, :common_core
    remove_column :standards, :national_core
    remove_column :standards, :art_elements
    remove_column :standards, :art_principles
    remove_column :standards, :cross_curricular
  end
end
