class RemoveGenderFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :gender, :string
  end
end
