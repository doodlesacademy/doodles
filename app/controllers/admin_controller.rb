class AdminController < Admin::ApplicationController
  before_action :authenticate_user!, :admin_only!

  def index
  end
end
