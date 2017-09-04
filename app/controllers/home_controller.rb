class HomeController < ApplicationController
  before_action :featured_lessons, only: [:index]

  def index
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

  def donate
  end

  def donor
  end

  def memberships
  end

  def subscribe
    @disable_shared = true
  end

  def page
    @page = Page.find_by_slug(params[:slug])
    not_found unless @page.present?
  end

  private
    def featured_lessons
      @intro_video_url = "https://player.vimeo.com/video/187513105"
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
