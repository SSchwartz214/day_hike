class Trip < ApplicationRecord
  validates_presence_of :name, :start_date, :end_date

  has_many :users
  has_many :trails, through: :users

  def total_distance
    trails.sum(:length)
  end

  def average_trail_distance
    trails.average(:length)
  end

  def longest_trail_distance
    trails.maximum(:length)
  end

  def shortest_trail_distance
    trails.minimum(:length)
  end
end
