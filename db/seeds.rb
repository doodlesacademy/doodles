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

superhero_set = ProjectSet.create({ 
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
superhero_lower_1.save
