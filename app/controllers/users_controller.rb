# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to events_path, success: 'ユーザー登録が完了しました'
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def show
    @user = User.find_by(name: params[:name])
    if @user
      render :show
    else
      flash[:danger] = "#{params[:name]}は存在しません"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
