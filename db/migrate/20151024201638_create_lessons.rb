class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.belongs_to :project, index: true
      t.string :title
      t.text :description
      t.timestamps null: false
    end
  end
end
