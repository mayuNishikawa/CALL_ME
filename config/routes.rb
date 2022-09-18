Rails.application.routes.draw do
  root 'homes#show'

  resources :homes, only: :show
  resources :chats, only: %i[ new create ]
  resources :teams do
    member do
      get :member
    end
    resources :assigns, only: %i[ create destroy ]
  end
  resources :posts do
    resources :comments, only: %i[ create destroy ]
  end
  resources :users, only: :show 
  
  devise_for :users, controllers: {registrations: 'users/registrations'}, path: 'user'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
