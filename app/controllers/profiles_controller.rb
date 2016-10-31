class ProfilesController < ApplicationController

  def show
  end

  def update
    redirect_to artroom_path if current_user.update profile_params
  end

  private

  def profile_params
    params.require(:user).permit(profile_attributes: [:id, :first_name, :last_name, :avatar, :title, :school, :city, :state, :country, :occupation, :grades, :user_id])
  end
end
