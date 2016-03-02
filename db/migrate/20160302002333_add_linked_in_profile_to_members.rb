class AddLinkedInProfileToMembers < ActiveRecord::Migration
  def change
    add_column :members, :linked_in_profile, :string
  end
end
