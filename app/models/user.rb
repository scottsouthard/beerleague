class User < ActiveRecord::Base
  has_secure_password

  has_one :team, foreign_key: :manager_id
end
