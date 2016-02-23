class AddUnitToProjectSets < ActiveRecord::Migration
  def change
    add_column :project_sets, :unit, :string
  end
end
