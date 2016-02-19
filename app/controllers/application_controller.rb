class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :define_pages_and_social_links
  before_action :authenticate_user!, except: [:index, :show]

  def define_pages_and_social_links
    @pages = []
    @pages.push({ name: "About Us", path: about_path })
    @pages.push({ name: "Projects", path: projects_path })
    @pages.push({ name: "Partners", path: partners_path })
    @pages.push({ name: "Team", path: board_path })
    @pages.push({ name: "Get Involved", path: volunteer_path })

    name = "doodlesacademy"
    kebab_case_name = "doodles-academy"
    @social_links = []
    @social_links.push({ link: "http://twitter.com/#{name}", name: 'Twitter' })
    # @social_links.push({ link: "http://facebook.com/#{name}", name: 'Facebook' })
    @social_links.push({ link: "http://instagram.com/#{name}", name: 'Instagram' })
    # @social_links.push({ link: "http://linkedin.com/company/#{kebab_case_name}", name: 'Linked In' })
  end

end
