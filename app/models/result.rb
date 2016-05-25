class Result < ActiveRecord::Base
  belongs_to :game
  belongs_to :winner, class_name:"Team"
  belongs_to :loser, class_name:"Team"
end
