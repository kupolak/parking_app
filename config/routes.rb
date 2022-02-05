# frozen_string_literal: true

Rails.application.routes.draw do
  get 'bookings', to: 'bookings#index'
  root 'home#index'
  get '/auth/slack/callback', to: 'sessions#create'
end
