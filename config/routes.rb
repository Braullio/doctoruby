# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :doctors, only: %i[create update destroy]
  resources :patients, only: %i[create update destroy]
end
