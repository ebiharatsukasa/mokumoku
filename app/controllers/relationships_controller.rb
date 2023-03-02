class RelationshipsController < ApplicationController
  # フォローする
  def create
    user = User.find_by(name: params[:user_name])
    current_user.follow(user) if user
    redirect_to request.referer
  end
  # フォローを外す
  def destroy
    user = User.find_by(name: params[:user_name])
    current_user.unfollow(user) if user
    redirect_to request.referer
  end
end