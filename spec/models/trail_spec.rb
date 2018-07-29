require 'rails_helper'

describe Trail do
  describe "validations" do
    it{should validate_presence_of :name}
    it{should validate_presence_of :length}
    it{should validate_presence_of :address}

  end
  describe 'relationships' do
    it {should have_many :users}
    it {should have_many(:trips).through(:users)}
  end
  describe 'instance methods' do
    it '.amount_of_trips' do
      trail_1 = Trail.create!(name: "rocky", length: 10, address: "a street")

      trip_1 = trail_1.trips.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")
      trip_2 = trail_1.trips.create!(name: "denver", start_date: "2/1/11", end_date: "2/3/11")

      expect(trail_1.amount_of_trips).to eq(2)
    end
  end
end
