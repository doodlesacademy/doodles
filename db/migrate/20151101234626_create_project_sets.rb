class CreateProjectSets < ActiveRecord::Migration
  def change
    create_table :project_sets do |t|
      t.string :title
      t.belongs_to :upper, index: true
      t.belongs_to :lower, index: true
      t.timestamps null: false
    end
  end
end
