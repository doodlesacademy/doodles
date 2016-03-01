class AdminController < ApplicationController
  before_action :authenticate_user!, :admin_only!
  layout "admin"

  def index
  end
end
