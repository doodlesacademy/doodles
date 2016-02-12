# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

# Supplies

supplies = SupplyItem.create([
  { name: 'pencils' },
  { name: 'pens' },
  { name: 'markers' },
  { name: 'construction paper' },
  { name: 'scissors' },
  { name: 'glue' },
  { name: 'magazines' }
])

superhero = ProjectSet.create({
  title: 'Superheroes!',
  description: "Student artists learn to recognize shapes and types of line as they design and draw their own superheroes.  They begin by creating a book that tells the backstory of their superhero using their choice of drawing/writing/or a combination. They then move on to isolating graphic images into basic curved lines and using a handout to copy disparate parts of a superhero into their own unique character. They create this silhouette onto their final paper which will become the cover to their book. They learn about how costumes and details are another way of telling parts of the story, and they add to their superhero. They finish by completing their superheroes with pan watercolors.",
   skills_description: "Artists will be able to develop a backstory for their superhero and create with this story in mind, recognize, isolate, and copy line in a graphic image, add details to their character that help to tell the story they have developed, & show competence in using and controlling watercolor paint.",
  books_media: "Optional (for early finishers): 5-Minute Marvel Stories, old comics (check with a local comic book shop and ask for the comics that they typically throw away—many will sell in bulk or give away for free)."
})

# Lessons

upper_lesson = superhero.upper.lessons.create({
    video_uri: "https://vimeo.com/140998863",
    title: "Creating a Backstory",

    description: "In this lesson, artists are introduced to the basic characteristics of superheroes, as well as understanding that each superhero had his or her own unique backstory that told who they were, where they came from, and why or how they became a superhero. Student artists are tasked to brainstorm their own superhero and to generate a backstory for said character by creating a small book and using any combination of writing and drawing to document their superhero’s history. They leave the cover blank for the upcoming lessons.",

    objective: "SWBAT use multi-media to create and illustrate a narrative that explains their superhero’s backstory.",

    set_up: "Students will be working individually and choosing their own materials, so have materials set up in a way that is easy to pass out as well as easy for the student artists to see and select from."
})

upper_lesson.supply_items.concat(supplies)
upper_lesson.save

lower_lesson = superhero.lower.lessons.create({
  video_uri: "https://vimeo.com/140998518",
  title: "Creating a Backstory",

  description: "In this lesson, artists are introduced to the basic characteristics of superheroes, as well as understanding that each superhero had his or her own unique backstory that told who they were, where they came from, and why or how they became a superhero. Student artists are tasked to brainstorm their own superhero and to generate a backstory for said character by creating a small book and using any combination of writing and drawing to document their superhero’s history. They leave the cover blank for the upcoming lessons.",

  objective: "SWBAT use multi-media to create and illustrate a narrative that explains their superhero’s backstory.",

  set_up: "Students will be working individually and choosing their own materials, so have materials set up in a way that is easy to pass out as well as easy for the student artists to see and select from."
})

lower_lesson.supply_items.concat(supplies)
lower_lesson.save

# Members

Member.create({
  first_name: "Tempest",
  last_name: "Neucollins",
  bio: "Tempest NeuCollins is originally from Solon, Iowa. She moved to Portland, Oregon to study at Pacific Northwest College of Art for her BFA, then went on to New York City to receive an MFA from the School of Visual Arts in Studio Art. After graduating she worked for many non-profit organizations around New York City that provide an arts education to students in underserved communities, including TimeIn! and Free Arts NYC . Eventually she was asked to found and run an arts program at a Brooklyn based charter school, which she did for two years before founding Doodles Academy.  Tempest continues to make her own artwork, design lessons for Doodles Academy as well as act as Executive Director. Her lesson plans have been recognized and published in SchoolArts Magazine.",
  position: "Resident Bad Ass",
  role: 
})
Member.create({
  first_name: "Alex",
  last_name: "Neucollins",
  bio: "HAS. A. PYNCHON. TATTOO."
  position: "Bad Ass in Chief",
  role:
})
Member.create({
  first_name: "RJ",
  last_name: "Sheperd",
  bio: "THE.FUCKING.JAVASCRIPT.NINJA"
})
Member.create({
  first_name: "Jason",
  last_name: "Overby",
  bio: "Wow. Just wow."
})
Member.create({
  first_name: "Jordan",
  last_name: "Huller",
  bio: "Jordan Huller has worked in urban education for the last 5 years, in both instructional and operational capacities. Since the time he was in school, he has been drawn to all types of expressive mediums, and truly values the benefit of an art program that generates, and refines, students' abilities to be creative in the classroom. In his current work, Jordan works heavily in the talent management sector of Explore Schools, seeking to find, retain, and develop the best teachers for students. Jordan is incredibly excited to extend his work in schools, and with teachers, to a programmatic focus with Doodles Academy."
})
Member.create({
  first_name: "Carey",
  last_name: "Swanson",
  bio: "After growing up in Michigan and attending Northwestern University for a film degree, Carey Swanson began her teaching career in the South Bronx starting in 2001 through Teach for America.  Carey remained in education, teaching in Harlem and Brooklyn and eventually transitioning to school administration in 2007.  She earned an EDM in School Building Leadership through Teachers College at Columbia University and went on to become the founding Academic Director for Explore Exceed Charter School."
})
Member.create({
  first_name: "Amy",
  last_name: "Kiyota",
  bio: "Amy Kiyota is originally from Baltimore, Maryland, Amy developed a deep commitment to education, the arts, and community organizing through her experiences working in nonprofits, schools, and communities. She began her career as a Philly Fellow working with the Philadelphia Education Fund, taking on a variety of responsibilities from evaluating metrics to supporting fundraising efforts. She later worked in the arts, including fundraising for the Asian Arts Initiative, a local community-based arts nonprofit. She served as the Executive Director of the Pennsylvania Governor's Advisory Commission on Asian American Affairs, and holds a master’s degree in Education and Economics from Columbia University. Amy graduated summa cum laude from Ursinus College with a BA in East Asian Studies and minors in Secondary Education and Japanese.</p>"
})
Member.create({
  first_name: "Alessandra",
  last_name: "Mosenifar",
  bio: "Alessandra Mosenifar is a UI Designer at charity: water, a nonprofit organization that uses innovative technologies to raise money to provide clean and safe drinking water for people in developing countries. There, Alessandra leads the strategy and design work of charity: water’s fundraising platform,  as well as manages the internal tools that help the organization run more efficiently. Before coming to New York, Alessandra was in China earning her master's in cross cultural design, and ultimately staying to work at a branding agency called Thread Design. Alessandra is passionate about helping people find their creative confidence and is excited to apply this passion toward the important work of Doodles Academy."
})

Member.create({
  first_name: "Patrick",
  last_name: "Comstock",
  bio: "Patrick W. Comstock is a graduate of the College of William and Mary in Virginia (B.A. in Religious Studies), Pace University (M.S.T. in Early Childhood Education), Harvard University (M.T.S. in Religion, Ethics, and Politics), and Columbia University (Ph.D. in Philosophy and Education). His doctoral dissertation, “The Retrieval of Contemplation: Mindfulness, Meditation, and Education,” addressed the educational value of contemplative practices. His research interests include the philosophy of education, ethics, Buddhist philosophy, and philosophy for children. Patrick is currently Assistant Professor at Relay Graduate School of Education."
})
