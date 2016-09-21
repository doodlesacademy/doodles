class UsersController < ApplicationController
  before_action :authenticate_user!, :admin_only!

  def index
    @users = User.all
    @profiles = Profile.all
  end

  def show
    @user = User.find(params[:id])
    # @profile = Profile.find(params[:id])
    @profile = @user.profile.find(params[:user_id])
    @title = @profile.title
  end

  def create
    @user = User.create(user_params)
    # @profile = Profile.where(user_id: @user.id, profile_params).first_or_create
    # redirect_to action: 'show', id: @user.id
    # @profile = user.profiles.build(params[:profile])
    # @profile.save
    # @profile = Profile.create(user_id: @user.id, profile_params)
    @profile = @user.profile.create(profile_params)
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
    params.require(:user).permit(:role :profile, :title, :profile[:title])
  end

end
