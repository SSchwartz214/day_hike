class Trail < ApplicationRecord
  has_many :users
  has_many :trips, through: :users
end
