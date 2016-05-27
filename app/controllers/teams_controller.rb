class TeamsController < ApplicationController
  before_action :set_team, except: [:new, :create]
  before_action :set_season, :set_league
  before_action :check_admin, except: [:show, :edit, :update]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to [@league, @season, @team]
    else
      @errors = @team.errors.full_messages
      render :new
    end
  end

  def show

    @team_games = @team.games.order(:start_date)
    @team_players = @team.users
    @membership = Membership.new
  end

  def edit
    @team_games = @team.games
  end

  def update
    @team.update_attributes(team_params)
    if @team.save
      redirect_to @team
    else
      @errors = @team.errors.full_messages
      render new_team_path
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :manager_id, :season_id)
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def set_season
    @season = Season.find(params[:season_id])
  end

  def set_league
    @league = League.find(params[:league_id])
  end
end
