require 'roo'
require 'pry'
require 'stringex'

namespace :doodles do

  def find_lesson(row)
    project_name = row[:project_name]
    academy = row[:academy].downcase.to_sym
    title = row[:lesson_name]
    project_set = ProjectSet.find_by(slug: project_name.to_url)
    return unless project_set.present?
    project = project_set.get_project(level: academy)
    return unless project.present?
    #return project.lessons.new(title: title)
    return project.lessons.find_or_create(title: title)
  end

  def import_lesson(row)
    lesson = find_lesson(row)
    return unless lesson.present?

    lesson.update_attributes(
      inspiration_image_description: lesson[:inspiration_image_description]
    )

    #section = lesson.sections.new(content: '')
    section = lesson.sections.first()
    section.content = ''

    title = "# Overview\n"
    section.content += title unless section.content.include? title

    groups = [:synopsis, :objective, :setup, :materials, :photocopies, :media]
    groups.each do |group|
      title = group.to_s
      section.content += "## #{ title.titleize }\n" 
      section.content +=  "#{row[group]}\n\n"
    end
    #puts section.content
    section.save()
  end

  def import_lesson_instructions(row)
    lesson = find_lesson(row)
    return unless lesson.present?
    #section = lesson.sections.new(content: "")
    section = lesson.sections.first()

    title = "# Lesson\n"
    section.content += title unless section.content.include? title

    section.content +=  "## #{row[:group]}\n"
    section.content +=  "### #{row[:title]}\n"
    section.content +=  "#### #{row[:time]}\n" if row[:time]
    section.content +=  "#{row[:description]}\n\n"
    #puts section.content
    section.save()
  end

  def import_lesson_issues(row)
    lesson = find_lesson(row)
    return unless lesson.present?

    #section = lesson.sections.new(content: '')
    section = lesson.sections.first()

    title = "# Extension\n"
    section.content += title unless section.content.include? title

    groups = [:anticipated_problems, :early_finishers]
    groups.each do |group|
      title = group.to_s
      section.content += "## #{ title.titleize }\n" 
      section.content +=  "#{row[group]}\n\n"
    end
    #puts section.content
    section.save()
  end

  desc "Imports the Lessons to the Database"
  task :import_lesson_instruction => :environment do
    puts "Importing Lesson Instructions"
    instructions = Roo::CSV.new('data/lessons-4-2-2016/instructions.csv')
    instructions.each(
      academy: 'Academy', 
      project_name: 'Project Name', 
      order: 'Order', 
      lesson_name: 'Lesson Name',
      group: 'Group',
      title: 'Title',
      time: 'Time',
      description: 'Description'
    ) { |r| import_lesson_instructions(r) }
  end

  task :import_lesson_overview => :environment do
    puts "Importing Lesson Overviews"
    overview_issues = Roo::CSV.new('data/lessons-4-2-2016/overview-issues.csv')
    overview_issues.each( 
      academy: 'Academy', 
      project_name: 'Project Name', 
      order: 'Order', 
      lesson_name: 'Lesson Name',
      synopsis: 'Synopsis',
      objective: 'Objective',
      setup: 'Set-up',
      materials: 'Materials',
      photocopies: 'Photocopies',
      media: 'Media',
      inspiration_image_description: 'Inspiration Image Description'
    ) { |row| import_lesson(row) }
  end

  task :import_lesson_issue => :environment do
    puts "Importing Lesson Issues"
    overview_issues = Roo::CSV.new('data/lessons-4-2-2016/overview-issues.csv')
    overview_issues.each( 
      academy: 'Academy', 
      project_name: 'Project Name', 
      order: 'Order', 
      lesson_name: 'Lesson Name',
      anticipated_problems: 'Anticipated Problems',
      early_finishers: 'Early Finishers'
    ) { |row| import_lesson_issues(row) }
  end

  task :import_lessons => [:import_lesson_overview, :import_lesson_instruction, :import_lesson_issue] do
    puts "Imported Lessons successfully!"
  end

end
