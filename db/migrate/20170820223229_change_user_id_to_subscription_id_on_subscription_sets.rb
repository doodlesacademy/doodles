class ChangeUserIdToSubscriptionIdOnSubscriptionSets < ActiveRecord::Migration
  def change
    rename_column :subscription_sets, :user_id, :subscription_id
    add_index :subscription_sets, :subscription_id
  end
end
