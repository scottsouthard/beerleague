class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team
    else
      @errors = @team.errors.full_messages
      render new_team_path

    end
  end

  def show
    @team = Team.find(params[:id])
    @team_games = @team.games
    @team_players = @team.players
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:name, :manager_id, :season_id)
  end
end
