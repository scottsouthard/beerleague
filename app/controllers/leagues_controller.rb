class LeaguesController < ApplicationController

  def show
    @teams = Team.all.sort do |a, b|
      b.wins.count <=> a.wins.count
    end
    upcoming_games = Game.all.sort do |a, b|
      b.start_date <=> a.start_date
    end
    upcoming_games.map do |game|
      if game.start_date > DateTime.now
        game
      end
      @upcoming_games = upcoming_games
    end

  end



end
