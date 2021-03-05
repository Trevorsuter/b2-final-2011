class Passenger < ApplicationRecord
  has_many :tickets
  has_many :flights, through: :tickets
  validates_presence_of :name
  validates_presence_of :age
end