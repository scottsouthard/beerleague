class ResultsController < ApplicationController
  before_action :set_result, only: [:edit, :update]

  def edit
    teams = Participant.where(game_id: @result.game_id)
    @teams = teams.map do |team|
      Team.find(team.team_id)
    end
  end

  def update
    if @result.update(result_params)
      redirect_to game_path(params[:id])
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
