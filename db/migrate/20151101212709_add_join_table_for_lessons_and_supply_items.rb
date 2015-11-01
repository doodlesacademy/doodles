class AddJoinTableForLessonsAndSupplyItems < ActiveRecord::Migration
  def change
    create_table :lessons_supply_items, id: false do |t|
      t.belongs_to :lesson, index: true
      t.belongs_to :supply_item, index: true
    end
  end
end
