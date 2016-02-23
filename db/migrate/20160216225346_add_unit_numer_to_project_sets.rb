class AddUnitNumerToProjectSets < ActiveRecord::Migration
  def change
    add_column :project_sets, :unit_number, :integer
  end
end
