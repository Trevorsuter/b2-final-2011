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
end