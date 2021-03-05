require 'rails_helper'

RSpec.describe 'flights index page', type: :feature do
  before :each do 
    @flight1 = Flight.create!(number: 1, date: "date1", time: "time1", departure_city: "Denver", arrival_city: "St. Louis")
    @flight2 = Flight.create!(number: 2, date: "date2", time: "time2", departure_city: "Chicago", arrival_city: "Los Angeles")
    @flight3 = Flight.create!(number: 3, date: "date3", time: "time3", departure_city: "New York City", arrival_city: "Boston")

    visit flights_path
  end
  describe 'when I visit a flights index page' do
    # As a visitor
    # When I visit the flights index page
    # I see each flight in the system including its number, departure city, and arrival city
    # And I see that flights are listed in alphabetical order by departure city (A - Z)
    it 'sees each flight in the system by its flight number' do

      within(".flights") do
        expect(page).to have_content(@flight1.number)
        expect(page).to have_content(@flight2.number)
        expect(page).to have_content(@flight3.number)
      end
    end
    it 'sees each flights departure city, and arrival city' do

      within(".flight-#{@flight1.id}") do
        expect(page).to have_content(@flight1.departure_city)
        expect(page).to have_content(@flight1.arrival_city)
        expect(page).to_not have_content(@flight2.departure_city)
        expect(page).to_not have_content(@flight3.departure_city)
        expect(page).to_not have_content(@flight2.arrival_city)
        expect(page).to_not have_content(@flight3.arrival_city)
      end

      within(".flight-#{@flight2.id}") do
        expect(page).to have_content(@flight2.departure_city)
        expect(page).to have_content(@flight2.arrival_city)
        expect(page).to_not have_content(@flight1.departure_city)
        expect(page).to_not have_content(@flight3.departure_city)
        expect(page).to_not have_content(@flight1.arrival_city)
        expect(page).to_not have_content(@flight3.arrival_city)
      end

      within(".flight-#{@flight3.id}") do
        expect(page).to have_content(@flight3.departure_city)
        expect(page).to have_content(@flight3.arrival_city)
        expect(page).to_not have_content(@flight2.departure_city)
        expect(page).to_not have_content(@flight1.departure_city)
        expect(page).to_not have_content(@flight2.arrival_city)
        expect(page).to_not have_content(@flight1.arrival_city)
      end
    end
    it 'sees that the flights are listed in alphabetical order' do

      within(".flights") do
        expect(@flight2.departure_city).to appear_before(@flight1.departure_city)
        expect(@flight2.departure_city).to appear_before(@flight3.departure_city)
        expect(@flight1.departure_city).to appear_before(@flight3.departure_city)
        expect(@flight3.departure_city).to_not appear_before(@flight2.departure_city)
        expect(@flight1.departure_city).to_not appear_before(@flight2.departure_city)
        expect(@flight3.departure_city).to_not appear_before(@flight2.departure_city)
      end
    end
  end
end