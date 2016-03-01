class AddLeadToPage < ActiveRecord::Migration
  def change
    add_column :pages, :lead, :text
  end
end
