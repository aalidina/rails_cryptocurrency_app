class UsersController < ApplicationController
  #set_user method called before the action.this allows to not have to #repeat the code.
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @user = User.find_by(:id)
  end
  def new
    @user = User.new
  end

#creating a new user using perms from stong method user_perms
  def create
    @user = User.create(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
      #redirects to user/:id
    end
  end

  def show
    if logged_in? === false
      redirect_to login_path
    end
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
