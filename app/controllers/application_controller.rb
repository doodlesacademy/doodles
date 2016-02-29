class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :define_pages_and_social_links, :define_academy_level, :homepage?
  before_action :authenticate_user!, :editor_only!, only: [:edit, :update, :delete]

  helper MarkdownHelper

  def homepage?
    @homepage = (request.path =~ /^\/$/).present?
  end
  
  def editor_only!
    unless current_user.editor? || current_user.admin?
      redirect_to new_user_session_path
    end
  end

  def admin_only!
    unless current_user.admin?
      redirect_to new_user_session_path
    end
  end

  def redirect_to_admin
    redirect_to admin_path
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private
  def define_academy_level
    if ['upper', 'lower'].include? request.subdomain
      session[:level] = request.subdomain
    end
    if not ['upper', 'lower'].include? session[:level]
      session[:level] = "lower"
    end
    @academy_level = session[:level].to_sym
  end

  def define_pages_and_social_links
    @pages = []
    @pages.push({ name: "About Us", path: about_path })
    @pages.push({ name: "Projects", path: projects_path })
    @pages.push({ name: "Partners", path: partners_path })
    @pages.push({ name: "Team", path: board_path })
    @pages.push({ name: "PDX Class", path: classes_path })

    name = "doodlesacademy"
    kebab_case_name = "doodles-academy"
    @social_links = []
    @social_links.push({ link: "http://twitter.com/#{name}", name: 'Twitter' })
    # @social_links.push({ link: "http://facebook.com/#{name}", name: 'Facebook' })
    @social_links.push({ link: "http://instagram.com/#{name}", name: 'Instagram' })
    # @social_links.push({ link: "http://linkedin.com/company/#{kebab_case_name}", name: 'Linked In' })
    @social_links.push({ link: "http://facebook.com/#{name}", name: 'Facebook' })
    # @social_links.push({ link: "http://facebook.com/company/#{kebab_case_name}", name: 'Facebook' })
  end

end
