# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get    '/authorize', to: 'oauth#authorize'
  get    '/oauth/callback', to: 'oauth#authorize_callback'
  # Defines the root path route ("/")
  # root "articles#index"
end
