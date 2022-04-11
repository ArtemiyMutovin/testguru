# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests, only: %i[index show] do
    resources :questions, only: %i[index new]
  end

  resources :questions, only: :show
end
