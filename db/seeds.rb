# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

superhero_set = ProjectSet.create({ title: 'Superheroes' })
superhero_set.upper = Project.create({
  title: 'Superheroes',
  level: 'upper',
  description: "Student artists learn to recognize shapes and types of line as they design and draw their own superheroes.  They begin by creating a book that tells the backstory of their superhero using their choice of drawing/writing/or a combination. They then move on to isolating graphic images into basic curved lines and using a handout to copy disparate parts of a superhero into their own unique character. They create this silhouette onto their final paper which will become the cover to their book. They learn about how costumes and details are another way of telling parts of the story, and they add to their superhero. They finish by completing their superheroes with pan watercolors.",
  skills_description: "Artists will be able to develop a backstory for their superhero and create with this story in mind, recognize, isolate, and copy line in a graphic image, add details to their character that help to tell the story they have developed, & show competence in using and controlling watercolor paint.",
  books_media: "Optional (for early finishers): 5-Minute Marvel Stories, old comics (check with a local comic book shop and ask for the comics that they typically throw away—many will sell in bulk or give away for free)."
})
