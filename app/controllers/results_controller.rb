class ResultsController < ApplicationController
  before_action :set_result, only: [:edit, :update]
  before_action :set_path, only: [:create, :update, :setter]
  # before_action :set_teams, only: [:new, :edit]


  def new
    @result = Result.last
    # p params
    teams = Participant.where(game_id: @result.game_id)
    @teams = teams.map do |team|
      Team.find(team.team_id)
    end
  end

  def create
    if @result.update(result_params)
      redirect_to [@league, @season, @game]
    else
      render :new
    end
  end

  def edit
    teams = Participant.where(game_id: @result.game_id)
    @teams = teams.map do |team|
      Team.find(team.team_id)
    end
  end

  def update
    if @result.update(result_params)
      redirect_to [@league, @season, @game]
    else
      render :edit
    end
  end

  def setter
    @result = Result.new
    @result.game_id = @game.id
    @result.save
    redirect_to new_result_path
  end

  private
  def set_teams
    teams = Participant.where(game_id: @result.game_id)
    @teams = teams.map do |team|
      Team.find(team.team_id)
    end
  end

  def set_path
    @game = Game.find(params[:id])
    @season = Season.find(@game.season_id)
    @league = League.find(@season.league_id)
  end

  def set_result
    @result = Result.find(params[:id])
  end


  def result_params
    params.require(:result).permit(:winner_score, :loser_score, :description, :winner_id, :loser_id)
  end
end
