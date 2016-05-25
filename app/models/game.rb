class Game < ActiveRecord::Base
  has_one :result
  belongs_to :season
  has_many :participants
  has_many :teams, through: :participants
end
