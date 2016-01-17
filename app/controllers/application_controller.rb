class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :define_pages

  def define_pages
    @pages = []
    @pages.push "About Us"
    @pages.push "Projects"
    @pages.push "Partners"
    @pages.push "The Board"
    @pages.push "Get Involved"
  end

end
