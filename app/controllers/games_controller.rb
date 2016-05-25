class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:location, :start_date)
  end
end
