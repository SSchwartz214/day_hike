require 'rails_helper'

describe 'as a visitor' do
  describe "visit /trips" do
    it 'displays a list of all hiking trip names' do
      trip_1 = Trip.create!(name: "a", start_date: "1/1/11", end_date: "1/3/11")
      trip_2 = Trip.create!(name: "b", start_date: "1/2/11", end_date: "1/4/11")

      visit trips_path

      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_2.name)
    end
    describe 'can click on the name of a trip' do
      it 'goes to that trips show page' do
        trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")
        trip_2 = Trip.create!(name: "b", start_date: "1/2/11", end_date: "1/4/11")

        visit trips_path

        click_on "#{trip_1.name}"

        expect(current_path).to eq(trip_path(trip_1))
        expect(page).to have_content("#{trip_1.name}")

      end
    end
  end
end
