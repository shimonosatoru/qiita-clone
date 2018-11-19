# frozen_string_literal: true

 Rails.application.routes.draw do
  root 'articles#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }
  resources :articles

  get 'faq', to: 'pages#faq', as: :faq
  get 'terms', to: 'pages#terms', as: :terms

  resources :users, only: %i[index show]
end
