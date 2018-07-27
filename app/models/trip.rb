class Trip < ApplicationRecord
  has_many :users
  has_many :trails, through: :users
end
