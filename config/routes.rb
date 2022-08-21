Rails.application.routes.draw do
  root 'teams#index'

  resources :teams do
    member do
      get :member
    end
    resources :assigns, only: %i[ create destroy ]
  end
  resources :chats, only: %i[ new create destroy ]
  resources :posts
  resources :users, only: :show
  
  devise_for :users, controllers: {registrations: 'users/registrations'}, path: 'user'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
