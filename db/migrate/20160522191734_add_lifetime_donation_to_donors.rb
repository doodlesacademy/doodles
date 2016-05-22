class AddLifetimeDonationToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :lifetime_donation, :integer
  end
end
