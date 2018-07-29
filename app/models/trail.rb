class Trail < ApplicationRecord

  validates_presence_of :name, :length, :address

  has_many :users
  has_many :trips, through: :users

  def amount_of_trips
    trips.count
  end
end
