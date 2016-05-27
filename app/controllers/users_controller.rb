class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = User.find(session[:user_id])
      @user_memberships = @user.memberships
      if @user_memberships.length == 1
        @team = @user_memberships[0].team
        redirect_to league_season_team_path(@team.season.league.id, @team.season.id, @team.id)
      elsif admin?
        redirect_to leagues_path
      end
    end
  end

  private

  def set_user
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

end
