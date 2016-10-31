class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :define_pages_and_social_links, :define_academy_level, :homepage?, :user_sign_in?
  # before_action :authenticate_user!, :editor_only!, only: [:edit, :update, :delete]
  # Devise Parameters
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def homepage?
    @homepage = (request.path =~ /^\/$/).present?
  end

  def user_sign_in?
    @user_sign_in = (request.path =~ /\/users\/sign_in/).present?
  end

  def after_sign_in_path_for(resource)
    artroom_path
  end

  def editor_only!
    unless current_user.editor? || current_user.admin?
      redirect_to new_user_session_path
    end
  end

  def admin_only!
    unless authenticate_user! && current_user.admin?
      redirect_to new_user_session_path
    end
  end

  def redirect_to_admin
    redirect_to admin_path
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected
  # Devise Parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [profile_attributes: [:first_name, :last_name, :avatar, :title, :school, :city, :state, :country, :occupation, :grades, :user_id]]
    devise_parameter_sanitizer.for(:account_update) << [:email, :password, :password_confirmation, :current_password, profile_attributes: [:first_name, :last_name, :avatar, :title, :school, :city, :state, :country, :occupation, :grades, :user_id]]
  end

  private
  def define_academy_level
    if ['upper', 'lower'].include? params[:academy]
      @academy = params[:academy].to_sym
    else
      @academy = :lower
    end
  end

  def define_pages_and_social_links
    @pages = []
    @pages.push({ name: "About Us", path: about_path })
    @pages.push({ name: "Projects", path: projects_path })
    @pages.push({ name: "Supporters", path: supporters_path })
    @pages.push({ name: "Team", path: team_path })
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
