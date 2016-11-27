class AddTeachersPayTeachersLinkToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :teachers_pay_teachers_link, :text
  end
end
