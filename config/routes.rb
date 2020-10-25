# frozen_string_literal: true

Rails.application.routes.draw do
  root 'teams#index'
  devise_for :users
  resources :memberships
  resources :messages
  resources :topics
  resources :rooms
  resources :teams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
