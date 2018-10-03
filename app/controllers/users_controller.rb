class UsersController < ApplicationController

  def new
    @user = User.new
  end

#creating a new user using perms from stong method user_perms
  def create
    @user = User.create(user_perms)
  end


  private
#prevents hacker from entering different perms then then one in the app
  def user_perms
    perms.require(:user).permit(:username, :email, :password)
  end
end
