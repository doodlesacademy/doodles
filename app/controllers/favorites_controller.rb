class FavoritesController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def create
    user_id = current_user.id
    project_set_id = params[:project_set_id]

    if Favorite.create(user_id: user_id, project_set_id: project_set_id)
      head :ok
    else
      head :error
    end
  end

  def destroy
    user_id = current_user.id
    project_set_id = params[:project_set_id]
    favorite = Favorite.where(project_set_id: project_set_id, user_id: user_id)

    if favorite.blank? || favorite.destroy_all
      # Returning :ok even if no such favorite exists so as to keep front-end apprised
      head :ok
    else
      head :error
    end
  end
end
