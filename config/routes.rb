# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root to: 'tests#index'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, only: %i[index new create]

    member do
      post :start
    end
  end

  resources :questions, only: %i[show edit update] do
    resources :answers
  end

  resources :answers

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
