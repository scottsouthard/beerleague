class SeasonsController < ApplicationController
  before_action :set_league, :set_season

  def show
    @seasons = Season.where(league_id: 1)

    @teams = Team.where(season_id: params[:id]).sort do |a, b|
      b.wins.count <=> a.wins.count
    end
    upcoming_games = Game.where(season_id: params[:id]).sort do |a, b|
      b.start_date <=> a.start_date
    end
    @upcoming_games = []
    upcoming_games.each do |game|
      if game.start_date > DateTime.now
        @upcoming_games << game
      end
    end
    @upcoming_games = @upcoming_games[0..4]

    recent_games = Game.where(season_id: params[:id]).sort do |a, b|
      b.start_date <=> a.start_date
    end
    @recent_games = []
    recent_games.each do |game|
      if game.start_date < DateTime.now
        @recent_games << game
      end
    end
    @recent_games = @recent_games[0..4]
    p @recent_games
  end

private

  # def find_games(games)
  #   scheduled_games = []
  #   games.each do |game|
  #     if game.start_date > DateTime.now
  #       scheduled_games << game
  #     end
  #   end
  #   scheduled_games
  # end
  def set_season
    @season = Season.find(params[:id])
  end

  def set_league
    @league = League.find(params[:league_id])
  end
end
