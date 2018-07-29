describe Trip do

  describe 'validations' do
    it{should validate_presence_of :name}
    it{should validate_presence_of :start_date}
    it{should validate_presence_of :end_date}
  end
  describe "relationships" do
    it{should have_many(:users)}
    it{should have_many(:trails).through(:users)}
  end
  describe "instance methods" do
    it '.total_distance' do

      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")

      trail_1 = trip_1.trails.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = trip_1.trails.create!(name: "muddy", length: 20, address: "b drive")

      expect(trip_1.total_distance).to eq(30)
    end
    it '.average_trail_distance' do

      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")

      trail_1 = trip_1.trails.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = trip_1.trails.create!(name: "muddy", length: 20, address: "b drive")

      expect(trip_1.average_trail_distance).to eq(15)
    end
    it '.longest_trail_distance' do

      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")

      trail_1 = trip_1.trails.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = trip_1.trails.create!(name: "muddy", length: 20, address: "b drive")

      expect(trip_1.longest_trail_distance).to eq(20)
    end
    it '.shortest_trail_distance' do

      trip_1 = Trip.create!(name: "boulder", start_date: "1/1/11", end_date: "1/3/11")

      trail_1 = trip_1.trails.create!(name: "rocky", length: 10, address: "a street")
      trail_2 = trip_1.trails.create!(name: "muddy", length: 20, address: "b drive")

      expect(trip_1.shortest_trail_distance).to eq(10)
    end
  end
end
