class Flight < ApplicationRecord
  has_many :tickets
  has_many :passengers, through: :tickets
  validates_presence_of :number
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :departure_city
  validates_presence_of :arrival_city
end