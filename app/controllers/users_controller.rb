class UsersController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

#creating a new user using perms from stong method user_perms
  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = set_article
  end


  private

  def set_article
    User.find_by(id: params[:id])
  end

#prevents hacker from entering different perms then then one in the app
  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end
end
