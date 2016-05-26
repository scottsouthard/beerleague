class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @user_memberships = @user.memberships
    if @user_memberships.length == 1
      @team = @user_memberships[0].team
      redirect_to league_season_team_path(@team.season.league.id, @team.season.id, @team.id)
    end
  end


end
