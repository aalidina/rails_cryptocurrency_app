class UsersController < ApplicationController
  #set_user method called before the action.this allows to not have to #repeat the code.
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

#creating a new user using perms from stong method user_perms
  def create
    @user = User.create(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to new_wallet_path
    else
      redirect_to '/login'
    end
  end

  def show

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

#prevents hacker from entering different perms then then one in the app
  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end
end
