# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

superhero_set = ProjectSet.create({ title: 'Superheroes!' })


# Projects

superhero_set.upper = Project.create({
  title: 'Superheroes!',
  level: 'upper',
  description: "Student artists learn to recognize shapes and types of line as they design and draw their own superheroes.  They begin by creating a book that tells the backstory of their superhero using their choice of drawing/writing/or a combination. They then move on to isolating graphic images into basic curved lines and using a handout to copy disparate parts of a superhero into their own unique character. They create this silhouette onto their final paper which will become the cover to their book. They learn about how costumes and details are another way of telling parts of the story, and they add to their superhero. They finish by completing their superheroes with pan watercolors.",
  skills_description: "Artists will be able to develop a backstory for their superhero and create with this story in mind, recognize, isolate, and copy line in a graphic image, add details to their character that help to tell the story they have developed, & show competence in using and controlling watercolor paint.",
  books_media: "Optional (for early finishers): 5-Minute Marvel Stories, old comics (check with a local comic book shop and ask for the comics that they typically throw away—many will sell in bulk or give away for free)."
})

superhero_set.lower = Project.create({
  title: 'Superheroes!',
  level: 'lower',
  description: "Student artists learn to recognize shapes and types of line as they design and draw their own superheroes.  They begin by creating a book that tells the backstory of their superhero using their choice of drawing/writing/or a combination. They then move on to recognizing the basic shapes our bodies are composed of, drawing and cutting these shapes. They create various poses with these shapes and, when satisfied, trace or draw the silhouette onto their final paper (which will become the cover to their book). They learn about how costumes and details are another way of telling parts of the story, and they add to their superhero. They finish by learning the basics of watercolor painting and completing their superheroes with pan watercolors.",
  skills_description: "Artists will be able to develop a backstory for their superhero and create with this story in mind, recognize shape and line, copy and draw a recognizable superhero figure using their template, add details that help to tell the story they have developed, show competence in using watercolor paint and intentionally using color (i.e, keep colors separate and \"un-muddy\").",
  books_media: "Optional: 5-Minute Marvel Stories and/or old comics for early finishers"
})


# Lessons

superhero_upper_1 = Lesson.create({
    video_uri: "https://vimeo.com/140998863",
    title: "Creating a Backstory",

    description: "In this lesson, artists are introduced to the basic characteristics of superheroes, as well as understanding that each superhero had his or her own unique backstory that told who they were, where they came from, and why or how they became a superhero. Student artists are tasked to brainstorm their own superhero and to generate a backstory for said character by creating a small book and using any combination of writing and drawing to document their superhero’s history. They leave the cover blank for the upcoming lessons.",

    objective: "SWBAT use multi-media to create and illustrate a narrative that explains their superhero’s backstory.",

    set_up: "Students will be working individually and choosing their own materials, so have materials set up in a way that is easy to pass out as well as easy for the student artists to see and select from."
})

superhero_upper_1.supply_items.concat(supplies)
superhero_upper_1.save

superhero_set.upper.lessons << superhero_upper_1

superhero_set.upper.save


superhero_lower_1 = Lesson.create({
  video_uri: "https://vimeo.com/140998518",
  title: "Creating a Backstory",

  description: "In this lesson, artists are introduced to the basic characteristics of superheroes, as well as understanding that each superhero had his or her own unique backstory that told who they were, where they came from, and why or how they became a superhero. Student artists are tasked to brainstorm their own superhero and to generate a backstory for said character by creating a small book and using any combination of writing and drawing to document their superhero’s history. They leave the cover blank for the upcoming lessons.",

  objective: "SWBAT use multi-media to create and illustrate a narrative that explains their superhero’s backstory.",

  set_up: "Students will be working individually and choosing their own materials, so have materials set up in a way that is easy to pass out as well as easy for the student artists to see and select from."
})

superhero_lower_1.supply_items.concat(supplies)
superhero_lower_1.save

superhero_set.lower.lessons << superhero_lower_1

superhero_set.lower.save


superhero_set.save
