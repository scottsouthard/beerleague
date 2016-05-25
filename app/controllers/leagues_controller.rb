class LeaguesController < ApplicationController

  def show
    @teams = Team.all.sort do |a, b|
      b.wins.count <=> a.wins.count
    end
  end




end
