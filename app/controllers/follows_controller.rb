class FollowsController < ApplicationController
  def create
    user = User.find_by(username: params[:id])
    user.followers << current_user
    UserMailer.follow_notification(user, current_user).deliver
    redirect_to user_path(user.username)
  end

  def destroy
    user = User.find_by(username: params[:id])
    user.followers.delete(current_user)
    redirect_to user_path(user.username)
  end
end
