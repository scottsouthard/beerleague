class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @team = @user.team
  end


end
