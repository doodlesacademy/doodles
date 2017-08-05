class AddPersonalWebsiteToMembers < ActiveRecord::Migration
  def change
    add_column :members, :personal_website, :string
  end
end
