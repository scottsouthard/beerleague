class ResultsController < ApplicationController
  before_action :set_result, only: [:edit, :update]

  def edit
    teams = Participant.where(game_id: @result.game_id)
    @teams = teams.map do |team|
      Team.find(team.team_id)
    end
  end

  def update
    @game = Game.find(params[:id])
    @season = Season.find(@game.season_id)
    @league = League.find(@season.league_id)
    if @result.update(result_params)
      redirect_to [@league, @season, @game]
    else
      render :edit
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end


  def result_params
    params.require(:result).permit(:winner_score, :loser_score, :description, :winner_id, :loser_id)
  end
end
