# frozen_string_literal: true
Rails.application.routes.draw do

	resources :spots, only: [:index, :show, :new, :create]  
  devise_for :users
  resources :answers
  resources :questions
  root 'home#index'
  resources :home

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
