class Ticket < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight
  validates_presence_of :passenger
  validates_presence_of :flight
end