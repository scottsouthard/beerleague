class Team < ActiveRecord::Base
  has_many :players
  has_many :participants
  has_many :games, through: :participants
  has_many :wins, foreign_key: :winner_id, class_name:"Result"
  has_many :losses, foreign_key: :loser_id, class_name:"Result"
  belongs_to :manager, class_name:"User"
  belongs_to :season

  validates :name, :manager_id, :season_id, presence: true
  validates_uniqueness_of :name, :scope => :season_id
end
