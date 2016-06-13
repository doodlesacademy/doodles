class AddStatusToProjectSetsProjectsAndLessons < ActiveRecord::Migration
  def change
    add_column :project_sets, :status, :integer, default: 0
    add_column :projects, :status, :integer, default: 0
  end

  ProjectSet.all.each do |set|
    set.status = :published
    set.save if set.changed?
  end

  Project.all.each do |project|
    project.status = :published
    project.save if project.changed?
  end

  Lesson.all.each do |lesson|
    lesson.status = :published
    lesson.save if lesson.changed?
  end
end
