class Flight::PassengersController < ApplicationController

  def destroy
    Ticket.where(passenger_id: params[:id], flight_id: params[:flight_id])
      .first
      .destroy
    
    redirect_to "/flights/#{params[:flight_id]}"
  end
end