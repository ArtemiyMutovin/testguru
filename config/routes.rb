# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests do
    resources :questions, only: %i[index new create]
  end

  resources :questions, only: %i[show edit update]
end
