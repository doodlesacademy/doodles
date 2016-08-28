class AddUnitIdToProjectSets < ActiveRecord::Migration
  def change
    add_column :project_sets, :unit_id, :integer
  end
end
