class Flight < ApplicationRecord
  has_many :tickets
  has_many :passengers, through: :tickets
  validates_presence_of :number
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :departure_city
  validates_presence_of :arrival_city

  def self.ordered
    # order(:departure_city)
    joins(:passengers)
    .select('flights.*, count(passengers) as passenger_count')
    .group(:id)
    .order('passenger_count desc, departure_city')
  end

  def adult_passengers
    passengers.where('age >= 18')
  end

  def average_adult_age
    adult_passengers.average(:age)
  end
end