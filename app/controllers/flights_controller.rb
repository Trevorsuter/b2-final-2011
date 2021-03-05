class FlightsController < ApplicationController

  def index
    @flights = Flight.ordered
  end

  def show
    @flight = Flight.find(params[:id])
    @adults = @flight.adult_passengers
  end
end