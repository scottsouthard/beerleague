require 'faker'




4.times {
  manager = User.create(full_name: Faker::StarWars.droid, email: Faker::Internet.email, password: 'password')
  team = Team.create(name: Faker::Team.name, season_id: 1, manager_id: manager.id)

  10.times{
    player = Player.create(name: Faker::StarWars.character, team_id: team.id)
  }

  game = Game.create(location: Faker::StarWars.planet, season_id: 1)

  results = Result.create(game_id: game.id, winner_score: rand(6..10), loser_score: rand(1..5))

}

Season.create(name: "Spring 2016", league_id: 1)

Participant.create(game_id: 1, team_id: 1)
Participant.create(game_id: 1, team_id: 2)
Participant.create(game_id: 2, team_id: 3)
Participant.create(game_id: 2, team_id: 4)
Participant.create(game_id: 3, team_id: 1)
Participant.create(game_id: 3, team_id: 3)
Participant.create(game_id: 4, team_id: 2)
Participant.create(game_id: 4, team_id: 4)
