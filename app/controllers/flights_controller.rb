class FlightsController < ApplicationController

  def index
    @flights = Flight.ordered_by_departure
  end

  def show
    @flight = Flight.find(params[:id])
    @adults = @flight.adult_passengers
  end
end