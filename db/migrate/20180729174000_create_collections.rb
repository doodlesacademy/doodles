class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title, null: false

      t.timestamps null: false
    end

    create_table :collections_project_sets do |t|
      t.integer :collection_id, null: false
      t.integer :project_set_id, null: false
    end
  end
end
