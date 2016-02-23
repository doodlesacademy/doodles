class HomeController < ApplicationController
  before_action :featured_lessons, only: [:index]

  def index
    @intro_video_url = "https://player.vimeo.com/video/151472643"
  end

  def board
  end

  def donors
  end

  def contact
  end

  def about
  end

  def partners 
  end

  def classes
  end

  def featured_lessons
    @featured_lessons = []
    @featured_lessons.push({
        title: "Symbol & Self",
        video_id: "144787451",
        image: "inspiration/symbol_self.jpg"
      })

    @featured_lessons.push({
        title: "Superhero Lesson",
        video_id: "140998518",
        image: "inspiration/superhero.jpg"
      })


    @featured_lessons.push({
        title: "Dream Home",
        video_id: "144787451",
        image: "inspiration/dream_home.jpg"
      })
  end
end
