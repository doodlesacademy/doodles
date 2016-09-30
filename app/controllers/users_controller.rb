class UsersController < ApplicationController
  before_action :authenticate_user!, :admin_only!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit, user: @user
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.update_attribute(:status, User.statuses[:archived])
  end

  private
  def user_params
    params.require(:user).permit(:role, profile_attributes: [:first_name, :last_name, :instructor_image, :title, :school, :city, :state, :country, :occupation, :grades, :user_id])
  end

end
