# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bookings
  root "home#index"
  get "history", to: "bookings#index"
  post "show", to: "bookings#show"
  get "my_bookings", to: "bookings#user_bookings"
  get "release/:id", to: "bookings#release"

  get "spots", to: "spots#index"
  get "/auth/slack/callback", to: "sessions#create"
  get "/slack_sign_in/callback", to: "sessions#create"

  mount Slackathon::Engine => "/slack"
end
