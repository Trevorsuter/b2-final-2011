Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :flights, only: [:index, :show]

  delete "/flights/:flight_id/passengers/:id", to: "flight/passengers#destroy", as: :delete_flight_passenger
end
