class Trip < ApplicationRecord
  has_many :users
  has_many :trails, through: :users

  def total_distance
    Trail.sum(:distance)
  end
end
