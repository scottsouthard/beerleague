class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @user_teams = @user.teams
  end


end
