 require 'sidekiq/web'

 Rails.application.routes.draw do
   authenticate :user, ->(u) { u.admin? } do
     mount Sidekiq::Web => '/sidekiq'
   end

   devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

   root to: 'tests#index'

   resources :tests, only: :index do
     member do
       post :start
     end
   end

   resources :test_passages, only: %i[show update] do
     member do
       get :result
       get :gist
     end
   end

   resources :badges, only: :index

   namespace :admin do
     resources :tests do
       resources :questions
     end
   end

   namespace :admin do
     resources :questions do
       resources :answers
       resources :subscriptions, shallow: true, only: %i[create destroy]
     end
   end

   namespace :admin do
     resources :answers
   end

   namespace :admin do
     resources :files, only: :destroy
   end

   namespace :admin do
     resources :links, only: :destroy
   end

   namespace :admin do
     resources :gists, only: :index
   end

   namespace :admin do
     resources :badges, except: :show
   end
 end
