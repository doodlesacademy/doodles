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

superhero = ProjectSet.where(title: 'Superheroes').first_or_create({ 
  unit_number: 1,
  unit: "Basic Lines",
})

# Symbol Unit 
symbol = ProjectSet.where(title: 'Symbol & Self').first_or_create({ 
  unit_number: 2,
  unit: "Complex Line",
})

# Dream House Lesson
house = ProjectSet.where(title: 'Dream House').first_or_create({ 
  unit_number: 3,
  unit: "Observation Drawing",
})


# Members
Member.where(first_name: "Tempest").first_or_create({
  last_name: "Neucollins",
  bio: "Tempest NeuCollins is originally from Solon, Iowa. She moved to Portland, Oregon to study at Pacific Northwest College of Art for her BFA, then went on to New York City to receive an MFA from the School of Visual Arts in Studio Art. After graduating she worked for many non-profit organizations around New York City that provide an arts education to students in underserved communities, including TimeIn! and Free Arts NYC . Eventually she was asked to found and run an arts program at a Brooklyn based charter school, which she did for two years before founding Doodles Academy.  Tempest continues to make her own artwork, design lessons for Doodles Academy as well as act as Executive Director. Her lesson plans have been recognized and published in SchoolArts Magazine.",
  position: "Fingerpaint Expert",
  role: "board",
  avatar_url: ""
})

Member.where(first_name: "Alex").first_or_create({
  last_name: "Hunley",
  bio: "Alex is amazing.",
  position: "Crayon Ninja",
  role: "volunteer"
})

Member.where(first_name: "RJ").first_or_create({
  last_name: "Sheperd",
  bio: "RJ Sheperd hails from sunny San Diego, where most of his childhood was spent indoors working on robots with his friends. Since attending UC Berkeley for Mechanical Engineering, he has always in search of new ways to promote social change through technology, his chief concern being education. RJ is very excited to be working with the Doodles Academy team to make art education accessible to everyone.",
  role: "board",
  position: "Mud Specialist"
})

Member.where(first_name: "Jason").first_or_create({
  last_name: "Overby",
  bio: "Jason Overby has .",
  role: "volunteer",
  position: "Glitter Master"
})

Member.where(first_name: "Jordan").first_or_create({
  last_name: "Huller",
  bio: "Jordan Huller has worked in urban education for the last 5 years, in both instructional and operational capacities. Since the time he was in school, he has been drawn to all types of expressive mediums, and truly values the benefit of an art program that generates, and refines, students' abilities to be creative in the classroom. In his current work, Jordan works heavily in the talent management sector of Explore Schools, seeking to find, retain, and develop the best teachers for students. Jordan is incredibly excited to extend his work in schools, and with teachers, to a programmatic focus with Doodles Academy.",
  role: "board",
  position: "Paper Mache Sculptor"
})

Member.where(first_name: "Carey").first_or_create({
  last_name: "Swanson",
  bio: "After growing up in Michigan and attending Northwestern University for a film degree, Carey Swanson began her teaching career in the South Bronx starting in 2001 through Teach for America.  Carey remained in education, teaching in Harlem and Brooklyn and eventually transitioning to school administration in 2007.  She earned an EDM in School Building Leadership through Teachers College at Columbia University and went on to become the founding Academic Director for Explore Exceed Charter School.",
  role: "board",
  position: "Watercolor "
})

Member.where(first_name: "Amy").first_or_create({
  last_name: "Kiyota",
  bio: "Amy Kiyota is originally from Baltimore, Maryland, Amy developed a deep commitment to education, the arts, and community organizing through her experiences working in nonprofits, schools, and communities. She began her career as a Philly Fellow working with the Philadelphia Education Fund, taking on a variety of responsibilities from evaluating metrics to supporting fundraising efforts. She later worked in the arts, including fundraising for the Asian Arts Initiative, a local community-based arts nonprofit. She served as the Executive Director of the Pennsylvania Governor's Advisory Commission on Asian American Affairs, and holds a master’s degree in Education and Economics from Columbia University. Amy graduated summa cum laude from Ursinus College with a BA in East Asian Studies and minors in Secondary Education and Japanese.",
  role: "board",
  position: "Mixed Media Elitist"
})

Member.where(first_name: "Alessandra").first_or_create({
  last_name: "Mosenifar",
  bio: "Alessandra Mosenifar is a UI Designer at charity: water, a nonprofit organization that uses innovative technologies to raise money to provide clean and safe drinking water for people in developing countries. There, Alessandra leads the strategy and design work of charity: water’s fundraising platform,  as well as manages the internal tools that help the organization run more efficiently. Before coming to New York, Alessandra was in China earning her master's in cross cultural design, and ultimately staying to work at a branding agency called Thread Design. Alessandra is passionate about helping people find their creative confidence and is excited to apply this passion toward the important work of Doodles Academy.",
  role: "board",
  position: "DUPLO Architect"
})

Member.where(first_name: "Patrick").first_or_create({
  last_name: "Comstock",
  bio: "Patrick W. Comstock is a graduate of the College of William and Mary in Virginia (B.A. in Religious Studies), Pace University (M.S.T. in Early Childhood Education), Harvard University (M.T.S. in Religion, Ethics, and Politics), and Columbia University (Ph.D. in Philosophy and Education). His doctoral dissertation, “The Retrieval of Contemplation: Mindfulness, Meditation, and Education,” addressed the educational value of contemplative practices. His research interests include the philosophy of education, ethics, Buddhist philosophy, and philosophy for children. Patrick is currently Assistant Professor at Relay Graduate School of Education.",
  role: "board",
  position: ""
})
