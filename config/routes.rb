Rails.application.routes.draw do
  # root 'homes#show'
  resources :teams do
    resources :assigns, only: %i[ create destroy ]
  end
  resources :users, only: :show
  root 'chatrooms#show'
  resources :chats, only: %i[ create destroy ]
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {registrations: 'users/registrations'}, path: 'user'
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
