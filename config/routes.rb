# frozen_string_literal: true

Rails.application.routes.draw do
  get 'bookings', to: 'bookings#index'
  get 'spots', to: "spots#index"
  root 'home#index'
  get '/auth/slack/callback', to: 'sessions#create'
end
