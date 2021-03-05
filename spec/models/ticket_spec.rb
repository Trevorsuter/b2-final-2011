require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
    it {should belong_to :flight}
    it {should belong_to :passenger}
  end
  describe 'validations' do
    it {should validate_presence_of :passenger}
    it {should validate_presence_of :flight}
  end
end