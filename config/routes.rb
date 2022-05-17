# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  get 'sessions/new'
  get 'users/new'
  root to: 'tests#index'

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
