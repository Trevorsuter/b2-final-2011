require 'rails_helper'

RSpec.describe 'flights show page', type: :feature do
  before :each do 
    @flight1 = Flight.create!(number: 1, date: "date1", time: "time1", departure_city: "Denver", arrival_city: "St. Louis")
    @flight2 = Flight.create!(number: 2, date: "date2", time: "time2", departure_city: "Chicago", arrival_city: "Los Angeles")

    @passenger1 = Passenger.create!(name: "adult one", age: 25)
    @passenger2 = Passenger.create!(name: "adult two", age: 30)
    @passenger3 = Passenger.create!(name: "adult three", age: 50)
    @passenger4 = Passenger.create!(name: "child four", age: 15)
    @passenger5 = Passenger.create!(name: "child five", age: 10)
    @passenger6 = Passenger.create!(name: "child six", age: 5)
    @passenger7 = Passenger.create!(name: "adult seven", age: 20)
    @passenger8 = Passenger.create!(name: "child eight", age: 5)
    @passenger9 = Passenger.create!(name: "child nine", age: 10)
    @passenger10 = Passenger.create!(name: "adult ten", age: 45)

    Ticket.create!(passenger: @passenger1, flight: @flight1)
    Ticket.create!(passenger: @passenger2, flight: @flight1)
    Ticket.create!(passenger: @passenger3, flight: @flight1)
    Ticket.create!(passenger: @passenger4, flight: @flight1)
    Ticket.create!(passenger: @passenger5, flight: @flight1)
    Ticket.create!(passenger: @passenger6, flight: @flight1)
    Ticket.create!(passenger: @passenger7, flight: @flight1)
    Ticket.create!(passenger: @passenger8, flight: @flight1)
    Ticket.create!(passenger: @passenger9, flight: @flight2)
    Ticket.create!(passenger: @passenger10, flight: @flight2)

    visit flight_path(@flight1)

  end

  it 'shows the flights attributes' do

    within(".flight") do
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight1.date)
      expect(page).to have_content(@flight1.time)
      expect(page).to have_content(@flight1.departure_city)
      expect(page).to have_content(@flight1.arrival_city)
    end

  end

  it 'shows the names of the flights passengers over 18' do

    within(".adult-passengers") do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger7.name)

      expect(page).to_not have_content(@passenger4.name)
      expect(page).to_not have_content(@passenger5.name)
      expect(page).to_not have_content(@passenger6.name)
      expect(page).to_not have_content(@passenger8.name)
      expect(page).to_not have_content(@passenger9.name)
      expect(page).to_not have_content(@passenger10.name)
    end

  end

  it 'shows the average age of the flights passengers over 18' do

    within(".average-age") do
      expect(page).to have_content(@flight1.average_adult_age)
    end

  end
  
  it 'each customer has a button to remove that passenger from the flight' do

    within (".adult-#{@passenger1.id}") do
      expect(page).to have_button("remove")
      save_and_open_page
    end
    within (".adult-#{@passenger2.id}") do
      expect(page).to have_button("remove")
    end
    within (".adult-#{@passenger3.id}") do
      expect(page).to have_button("remove")
    end
    within (".adult-#{@passenger7.id}") do
      expect(page).to have_button("remove")
    end

  end

  it 'can remove a passenger from the flight'

  it 'doesnt affect other customers when a passenger is removed'
end

# Next to each passengers name I see a link or button to remove that passenger from that flight
# When I click on that link or button
# I'm returned to the flight's show page 
# And I no longer see that passenger listed