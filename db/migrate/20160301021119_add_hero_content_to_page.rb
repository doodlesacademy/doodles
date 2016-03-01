class AddHeroContentToPage < ActiveRecord::Migration
  def change
    add_column :pages, :hero_content, :text
  end
end
