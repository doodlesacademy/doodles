class UsersController < ApplicationController
  before_action :authenticate_user!, :admin_only!, only: [:index, :show, :edit]

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

  def artroom
    redirect_to '/users/sign_in' unless current_user.present?
  end

  private
  def user_params
    params.require(:user).permit(:role, :email, :password, :password_confirmation, :current_password)
  end

end
