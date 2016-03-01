# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Supplies

ProjectSet.delete_all
Project.delete_all
Lesson.delete_all
InstructionGroup.delete_all
Section.delete_all

supplies = %w(pencils markers construction\ paper scissors glue magazines)
supplies = supplies.map { |supply| SupplyItem.find_or_create_by(name: supply) }

Page.find_or_create(title: 'About').update_attributes({
  lead: "Doodles works to eliminate the barriers that too many teachers have in providing a high-quality arts education to their students. By creating an inventory of thoughtful and engaging art lessons, teachers assemble their curriculum-choosing the projects and activities they know are best for their students- and Doodles does the details."
})
