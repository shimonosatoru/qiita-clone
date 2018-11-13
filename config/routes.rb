# frozen_string_literal: true

 Rails.application.routes.draw do
  root 'users#index'

   devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }
  
   resources :users, only: %i[index show]
end
