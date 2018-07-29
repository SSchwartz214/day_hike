require 'rails_helper'

describe 'as a visitor' do
  describe "when I visit trail show page" do
    it 'shows all attributes of trips' do
      trail_1 = Trail.create!(name: "rocky", length: 10, address: "a street")

      trip_1 = trail_1.trips.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")
      trip_2 = trail_1.trips.create!(name: "denver", start_date: "2/1/11", end_date: "2/3/11")

      visit trail_path(trail_1)

      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_2.name)
      expect(page).to have_content(trip_1.total_distance)
      expect(page).to have_content(trip_2.total_distance)
    end
  end
  describe "when I visit trail show page" do
    it 'shows total number of hiking trips' do
      trail_1 = Trail.create!(name: "rocky", length: 10, address: "a street")

      trip_1 = trail_1.trips.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")
      trip_2 = trail_1.trips.create!(name: "denver", start_date: "2/1/11", end_date: "2/3/11")

      visit trail_path(trail_1)
      
      expect(page).to have_content(2)
    end
  end
end
