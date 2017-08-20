class CreateSubscriptionSets < ActiveRecord::Migration
  def change
    create_table :subscription_sets do |t|
      t.integer :user_id, null: false
      t.string :name
      t.timestamps null: false
    end

    create_table :subscription_sets_projects do |t|
      t.belongs_to :subscription_set, index: true
      t.belongs_to :project, index: true
    end
  end
end
