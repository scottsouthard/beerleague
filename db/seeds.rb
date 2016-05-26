require 'faker'

admin = User.create(full_name: Faker::Book.author, email: Faker::Internet.email, password: 'password', league_admin: true)
League.create(name: "Busch League", league_type: "hockey", admin_id: admin.id)

4.times {
  manager = User.create(full_name: Faker::Book.author, email: Faker::Internet.email, password: 'password', league_admin: false)
  team = Team.create(name: Faker::Team.name, season_id: 1, manager_id: manager.id)
  membership = Membership.create(team_id: team.id, user_id: manager.id, membership_type: 'manager')

  10.times{
    user = User.create(full_name: Faker::StarWars.character, email: Faker::Internet.email, password: 'password', league_admin: false)
    membership = Membership.create(team_id: team.id, user_id: user.id, membership_type: 'player')
  }

  game = Game.create(location: Faker::StarWars.planet, season_id: 1, start_date: Faker::Date.backward(14))

}
Season.create(name: "Spring 2016", league_id: 1)
Season.create(name: "Fall 2016", league_id: 1)

Participant.create(game_id: 1, team_id: 1)
Participant.create(game_id: 1, team_id: 2)
Result.create(game_id: 1, winner_id: 1, loser_id: 2, winner_score: rand(6..10), loser_score: rand(1..5))
Participant.create(game_id: 2, team_id: 3)
Participant.create(game_id: 2, team_id: 4)
Result.create(game_id: 2, winner_id: 3, loser_id: 4, winner_score: rand(6..10), loser_score: rand(1..5))
Participant.create(game_id: 3, team_id: 1)
Participant.create(game_id: 3, team_id: 3)
Result.create(game_id: 3, winner_id: 1, loser_id: 3, winner_score: rand(6..10), loser_score: rand(1..5))
Participant.create(game_id: 4, team_id: 2)
Participant.create(game_id: 4, team_id: 4)
Result.create(game_id: 4, winner_id: 4, loser_id: 2, winner_score: rand(6..10), loser_score: rand(1..5))
Game.create(location: Faker::StarWars.planet, season_id: 1, start_date: Faker::Date.forward(14))
Participant.create(game_id: 5, team_id: 1)
Participant.create(game_id: 5, team_id: 4)
