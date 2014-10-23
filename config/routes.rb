require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    member do
      post "follow" => "follows#create"
      delete "unfollow" => "follows#destroy"
    end
  end

  resources :text_shouts, only: [:create]
  resources :photo_shouts, only: [:create]
  resource :search, only: [:show]

  resources :shouts, only: [] do
    resource :like, only: [:create, :destroy]
  end

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  get "/:username" => "users#show", as: "user"

  root to: "sessions#new"

end
