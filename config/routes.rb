# frozen_string_literal: true

Rails.application.routes.draw do
  resources :spots
  resources :bookings
  get "history", to: "bookings#index"
  # post "reservation", to: "bookings#create"
  delete "destroy_reservation/:id", to: "bookings#destroy"
  get "user_bookings", to: "bookings#user_bookings"
  get "spots", to: "spots#index"
  get "spots/:id", to: "spots#show"
  root "home#index"
  get "/auth/slack/callback", to: "sessions#create"
  get "/slack_sign_in/callback", to: "sessions#create"

  post "reservation/:id", to: "bookings#reservation"


  mount Slackathon::Engine => "/slack"
  # get '*path', to: 'spots#index'

  # put
end
