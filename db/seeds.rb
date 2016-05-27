require 'faker'
require 'date'

# admin = User.create(full_name: Faker::Book.author, email: 'admin', password: 'password', league_admin: true)
# League.create(name: "Busch League", league_type: "hockey", admin_id: admin.id)

# 4.times {
#   manager = User.create(full_name: Faker::Book.author, email: Faker::Internet.email, password: 'password', league_admin: false)
#   team = Team.create(name: Faker::Team.name, season_id: 1, manager_id: manager.id)
#   membership = Membership.create(team_id: team.id, user_id: manager.id, membership_type: 'manager')

#   10.times{
#     user = User.create(full_name: Faker::StarWars.character, email: Faker::Internet.email, password: 'password', league_admin: false)
#     membership = Membership.create(team_id: team.id, user_id: user.id, membership_type: 'player')
#   }

#   game = Game.create(location: Faker::StarWars.planet, season_id: 1, start_date: Faker::Date.backward(14))

# }
# Season.create(name: "Spring 2016", league_id: 1)
# Season.create(name: "Fall 2016", league_id: 1)

# Participant.create(game_id: 1, team_id: 1)
# Participant.create(game_id: 1, team_id: 2)
# Result.create(game_id: 1, winner_id: 1, loser_id: 2, winner_score: rand(6..10), loser_score: rand(1..5))
# Participant.create(game_id: 2, team_id: 3)
# Participant.create(game_id: 2, team_id: 4)
# Result.create(game_id: 2, winner_id: 3, loser_id: 4, winner_score: rand(6..10), loser_score: rand(1..5))
# Participant.create(game_id: 3, team_id: 1)
# Participant.create(game_id: 3, team_id: 3)
# Result.create(game_id: 3, winner_id: 1, loser_id: 3, winner_score: rand(6..10), loser_score: rand(1..5))
# Participant.create(game_id: 4, team_id: 2)
# Participant.create(game_id: 4, team_id: 4)
# Result.create(game_id: 4, winner_id: 4, loser_id: 2, winner_score: rand(6..10), loser_score: rand(1..5))
# Game.create(location: Faker::StarWars.planet, season_id: 1, start_date: Faker::Date.forward(14))
# Participant.create(game_id: 5, team_id: 1)
# Participant.create(game_id: 5, team_id: 4)
# Game.create(location: Faker::StarWars.planet, season_id: 1, start_date: Faker::Date.forward(14))
# Participant.create(game_id: 6, team_id: 2)
# Participant.create(game_id: 6, team_id: 3)


# # User managing and playing
#   superman = User.create(full_name: Faker::Book.author, email: 'superman', password: 'password', league_admin: false)
#   team = Team.create(name: Faker::Team.name, season_id: 1, manager_id: superman.id)
#   membership = Membership.create(team_id: team.id, user_id: superman.id, membership_type: 'manager')
#   membership = Membership.create(team_id: team.id, user_id: superman.id, membership_type: 'player')

#   9.times{
#     user = User.create(full_name: Faker::StarWars.character, email: Faker::Internet.email, password: 'password', league_admin: false)
#     membership = Membership.create(team_id: team.id, user_id: user.id, membership_type: 'player')
#   }

# -- seeds --

admin = User.create(full_name: Faker::Book.author, email: 'admin@buschleague.com', password: 'password', league_admin: true)
League.create(name: "Busch League", league_type: "hockey", admin_id: admin.id)

Season.create(name: "Spring 2016", league_id: 1)
Season.create(name: "Fall 2016", league_id: 2)

8.times {
  manager = User.create(full_name: Faker::Book.author, email: Faker::Internet.email, password: 'password', league_admin: false)
  team = Team.create(name: Faker::Team.name, season_id: 1, manager_id: manager.id)
  membership = Membership.create(team_id: team.id, user_id: manager.id, membership_type: 'manager')

    9.times {
      user = User.create(full_name: Faker::StarWars.character, email: Faker::Internet.email, password: 'password', league_admin: false)
      membership = Membership.create(team_id: team.id, user_id: user.id, membership_type: 'player')
    }

  }


def generate_schedule
  array1 = [1,2,3,4,5,6,7,8]
  array2 = [8,7,6,5,4,3,2,1]

  array1.each do |number1|
    array2.each do |number2|
      if number1 != number2
        date = Faker::Date.between(16.days.ago, 80.days.from_now)
        game = Game.create(location: Faker::StarWars.planet, season_id: 1, start_date: date)
        p1 = Participant.create(game_id: game.id, team_id: number1)
        p2 = Participant.create(game_id: game.id, team_id: number2)

        if date < DateTime.now
          # determine a winner and a loser
          participants_array = [p1, p2]
          winner = participants_array.shuffle.pop
          loser = participants_array[0]

          # determine winner_score and loser_score
          winner_score = [*1..10].sample
          loser_score = winner_score * rand(0...1.0)

          # Create a result
          Result.create(game_id: game.id, winner_id: winner.team_id, loser_id: loser.team_id, winner_score: winner_score, loser_score: loser_score)
        end
      end
    end
  end
end

generate_schedule
