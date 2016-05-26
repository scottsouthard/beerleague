class GamesController < ApplicationController
  before_action :set_game, :set_league, :set_season, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to league_season_game_path
    else
      render :edit
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_season
    @season = Season.find(params[:season_id])
  end

  def set_league
    @league = League.find(params[:league_id])
  end

  def game_params
    params.require(:game).permit(:location, :start_date)
  end
end
