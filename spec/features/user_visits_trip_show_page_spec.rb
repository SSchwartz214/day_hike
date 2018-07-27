require 'rails_helper'

describe 'as a visitor' do
  describe "when I visit /trip" do
    it 'displays a list of all associated trails with attributes' do
      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")
      trip_2 = Trip.create!(name: "denver", start_date: "1/2/11", end_date: "1/4/11")

      trail_1 = Trail.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = Trail.create!(name: "muddy", length: 20, address: "b drive")
      user = User.create(name: "seth", trip: trip_1, trail: trail_1)

      visit trip_path(trip_1)

      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_1.address)
      expect(page).to have_content(trail_1.length)
    end
  end
end
