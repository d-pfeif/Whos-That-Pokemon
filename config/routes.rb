Rails.application.routes.draw do
  root "rooms#home"

  get "rooms/get", to: "rooms#get"
  resources :rooms
end
