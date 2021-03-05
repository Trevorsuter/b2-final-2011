require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships' do
    it {should have_many :tickets}
    it {should have_many(:flights).through(:tickets)}
  end
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end
end