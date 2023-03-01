class RelationshipsController < ApplicationController
  # フォローする
  def create
    user = User.find_by(name: params[:user_name])
    if user
      current_user.follow(user)
    else
      flash[:danger] = 'フォローできませんでした'
    end
    redirect_to request.referer
  end
  # フォローを外す
  def destroy
    begin
      user = User.find_by(name: params[:user_name])
      current_user.unfollow(user)
    rescue
      flash[:danger] = 'フォローを解除できませんでした'
    end
    redirect_to request.referer
  end
end