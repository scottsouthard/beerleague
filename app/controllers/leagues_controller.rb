class LeaguesController < ApplicationController
  before_action :set_league

  def index

  end

  def show
    @seasons = Season.where(league_id: 1)

    @teams = Team.all.sort do |a, b|
      b.wins.count <=> a.wins.count
    end
    upcoming_games = Game.all.sort do |a, b|
      b.start_date <=> a.start_date
    end
    @upcoming_games = []
    upcoming_games.each do |game|
      if game.start_date > DateTime.now
        @upcoming_games << game
      end
    end
    @upcoming_games = @upcoming_games[0..4]

    recent_games = Game.all.sort do |a, b|
      b.start_date <=> a.start_date
    end
    @recent_games = []
    recent_games.each do |game|
      if game.start_date < DateTime.now
        @recent_games << game
      end
    end
    @recent_games = @recent_games[0..4]
  end

private
  def set_league
    @league = League.find(1)
  end
end
