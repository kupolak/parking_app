# frozen_string_literal: true

Rails.application.routes.draw do
  resources :spots
  get 'history', to: 'bookings#index'
  get 'spots', to: "spots#index"
  root 'home#index'
  get '/auth/slack/callback', to: 'sessions#create'
end
