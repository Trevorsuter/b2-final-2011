require 'rails_helper'

RSpec.describe 'flights index page', type: :feature do
  before :each do 
    @flight1 = Flight.create!(number: 1, date: "date1", time: "time1", departure_city: "Denver", arrival_city: "St. Louis")
    @flight2 = Flight.create!(number: 2, date: "date2", time: "time2", departure_city: "Chicago", arrival_city: "Los Angeles")
    @flight3 = Flight.create!(number: 3, date: "date3", time: "time3", departure_city: "New York City", arrival_city: "Boston")

    @f1passenger1 = Passenger.create!(name: "flight 1 passenger 1", age: 25)
    @f1passenger2 = Passenger.create!(name: "flight 1 passenger 2", age: 25)
    @f1passenger3 = Passenger.create!(name: "flight 1 passenger 3", age: 25)
    @f1passenger4 = Passenger.create!(name: "flight 1 passenger 4", age: 25)
    @f1passenger5 = Passenger.create!(name: "flight 1 passenger 5", age: 25)
    @f2passenger1 = Passenger.create!(name: "flight 2 passenger 1", age: 25)
    @f2passenger2 = Passenger.create!(name: "flight 2 passenger 2", age: 25)
    @f2passenger3 = Passenger.create!(name: "flight 2 passenger 3", age: 25)
    @f2passenger4 = Passenger.create!(name: "flight 2 passenger 4", age: 25)
    @f3passenger1 = Passenger.create!(name: "flight 3 passenger 1", age: 25)
    @f3passenger2 = Passenger.create!(name: "flight 3 passenger 2", age: 25)
    @f3passenger3 = Passenger.create!(name: "flight 3 passenger 3", age: 25)
    @f3passenger4 = Passenger.create!(name: "flight 3 passenger 4", age: 25)

    Ticket.create!(flight: @flight1, passenger: @f1passenger1)
    Ticket.create!(flight: @flight1, passenger: @f1passenger2)
    Ticket.create!(flight: @flight1, passenger: @f1passenger3)
    Ticket.create!(flight: @flight1, passenger: @f1passenger4)
    Ticket.create!(flight: @flight1, passenger: @f1passenger5)
    Ticket.create!(flight: @flight2, passenger: @f2passenger1)
    Ticket.create!(flight: @flight2, passenger: @f2passenger2)
    Ticket.create!(flight: @flight2, passenger: @f2passenger3)
    Ticket.create!(flight: @flight2, passenger: @f2passenger4)
    Ticket.create!(flight: @flight3, passenger: @f3passenger1)
    Ticket.create!(flight: @flight3, passenger: @f3passenger2)
    Ticket.create!(flight: @flight3, passenger: @f3passenger3)
    Ticket.create!(flight: @flight3, passenger: @f3passenger4)
    visit flights_path
  end
  describe 'when I visit a flights index page' do

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
    
    # skipped for extension perposes
    xit 'sees that the flights are listed in alphabetical order' do

      within(".flights") do
        expect(@flight2.departure_city).to appear_before(@flight1.departure_city)
        expect(@flight2.departure_city).to appear_before(@flight3.departure_city)
        expect(@flight1.departure_city).to appear_before(@flight3.departure_city)
        expect(@flight3.departure_city).to_not appear_before(@flight2.departure_city)
        expect(@flight1.departure_city).to_not appear_before(@flight2.departure_city)
        expect(@flight3.departure_city).to_not appear_before(@flight2.departure_city)
      end

    end

    it 'sees that the flights are ordered by passenger count, then alphabetically' do

      within(".flights") do
        expect(@flight1.departure_city).to appear_before(@flight2.departure_city)
        expect(@flight2.departure_city).to appear_before(@flight3.departure_city)
      end
    end
  end
end