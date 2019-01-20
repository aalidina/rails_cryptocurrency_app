class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      @user = User.find_by(username: params[:sessions][:username])
      if @user && @user.authenticate(params[:sessions][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
        #redirects to users/id path displays users/show erb
      else
        flash[:notice]  = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def welcome

  end

  def destroy
    reset_session
    #session.delete :user_id
    redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
