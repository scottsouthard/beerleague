class SessionsController < ApplicationController

  def new
    render "login"
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    p @user
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render "login"
    end
  end

  def logout
    session.clear
    redirect_to :root
  end

end
