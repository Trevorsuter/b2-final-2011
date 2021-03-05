require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it {should have_many :tickets}
    it {should have_many(:passengers).through(:tickets)}
  end
  describe 'validations' do
    it {should validate_presence_of :number}  
    it {should validate_presence_of :date}  
    it {should validate_presence_of :time}  
    it {should validate_presence_of :departure_city}  
    it {should validate_presence_of :arrival_city}  
  end

  describe 'class methods' do
    before :each do 
      @flight1 = Flight.create!(number: 1, date: "date1", time: "time1", departure_city: "Denver", arrival_city: "St. Louis")
      @flight2 = Flight.create!(number: 2, date: "date2", time: "time2", departure_city: "Chicago", arrival_city: "Los Angeles")
      @flight3 = Flight.create!(number: 3, date: "date3", time: "time3", departure_city: "New York City", arrival_city: "Boston")
    end
    it 'can sort all flights by alphabetical order' do
      expect(Flight.ordered_by_departure).to eq([@flight2, @flight1, @flight3])
      expect(Flight.ordered_by_departure).to_not eq([@flight3, @flight1, @flight2])
    end
  end

  describe 'instance methods' do
    before :each do 
      @flight1 = Flight.create!(number: 1, date: "date1", time: "time1", departure_city: "Denver", arrival_city: "St. Louis")

      @passenger1 = Passenger.create!(name: "adult one", age: 18)
      @passenger2 = Passenger.create!(name: "adult two", age: 31)
      @passenger3 = Passenger.create!(name: "adult three", age: 50)
      @passenger4 = Passenger.create!(name: "child four", age: 15)
      @passenger5 = Passenger.create!(name: "child five", age: 10)
      
      Ticket.create!(passenger: @passenger1, flight: @flight1)
      Ticket.create!(passenger: @passenger2, flight: @flight1)
      Ticket.create!(passenger: @passenger3, flight: @flight1)
      Ticket.create!(passenger: @passenger4, flight: @flight1)
      Ticket.create!(passenger: @passenger5, flight: @flight1)
    end

    it 'can find all of its adult passengers' do
      expected = [@passenger1, @passenger2, @passenger3]

      expect(@flight1.adult_passengers.sort).to eq(expected.sort)
      expect(@flight1.adult_passengers).not_to include(@passenger4)
      expect(@flight1.adult_passengers).not_to include(@passenger5)
    end

    it 'can find the average age of its adult passengers' do
      expected = (@passenger1.age + @passenger2.age + @passenger3.age) / @flight1.adult_passengers.length

      expect(@flight1.average_adult_age).to eq(expected)
    end
  end
end