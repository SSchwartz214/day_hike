require 'rails_helper'

describe 'as a visitor' do
  describe "when I visit /trip" do
    it 'displays a list of all associated trails with attributes' do
      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")

      trail_1 = trip_1.trails.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = trip_1.trails.create!(name: "muddy", length: 20, address: "b drive")

      visit trip_path(trip_1)

      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_1.address)
      expect(page).to have_content(trail_1.length)
      expect(page).to have_content(trail_2.name)
      expect(page).to have_content(trail_2.address)
      expect(page).to have_content(trail_2.length)
    end
  end
  describe "when I visit /trip" do
    it 'displays a total distance of all trails' do
      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")

      trail_1 = trip_1.trails.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = trip_1.trails.create!(name: "muddy", length: 20, address: "b drive")

      visit trip_path(trip_1)

      expect(page).to have_content(30)
    end
  end
  describe "when I visit /trip" do
    it 'displays average distance of all trails' do
      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")

      trail_1 = trip_1.trails.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = trip_1.trails.create!(name: "muddy", length: 20, address: "b drive")

      visit trip_path(trip_1)

      expect(page).to have_content(15)
    end
  end
  describe "when I visit /trip" do
    it 'displays longest distance of all trails' do
      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")

      trail_1 = trip_1.trails.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = trip_1.trails.create!(name: "muddy", length: 20, address: "b drive")

      visit trip_path(trip_1)

      expect(page).to have_content(20)
    end
  end
  describe "when I visit /trip" do
    it 'displays a link to trail show page' do
      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")

      trail_1 = trip_1.trails.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = trip_1.trails.create!(name: "muddy", length: 20, address: "b drive")

      visit trip_path(trip_1)

      click_on trail_1.name

      expect(current_path).to eq(trail_path(trail_1))
    end
  end

end
