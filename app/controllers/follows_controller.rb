class FollowsController < ApplicationController
  def create
    user = User.find(params[:id])
    user.followers << current_user
    redirect_to "/#{current_user.username}"
  end
end
