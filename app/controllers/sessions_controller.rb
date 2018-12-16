class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(username: params[:sessions][:username])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      #redirects to users/id path displays users/show erb
    else
      flash[:notice]  = 'Invalid email/password combination'
      render 'new'
    end
  end

  def welcome

  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
