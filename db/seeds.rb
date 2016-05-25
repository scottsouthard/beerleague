require 'faker'




4.times {
  manager = User.create(full_name: Faker::StarWars.droids, email: Faker::Internet.email, password: 'password')
  team = Team.create(name: Faker::Team.name, season_id: 1, manager_id: manager.id)

  10.times{
    player = Player.create(name: Faker::StarWars.character, team_id: team.id)
  }

  game = Game.create(location: Faker::StarWars.planet)

  results = Result.create(game_id: game.id, winner_score: rand(6..10), loser_score: rand(1..5))

  2.times {
    Participant.create(game_id: game.id)
  }
}
