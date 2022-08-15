Rails.application.routes.draw do
  root 'homes#show'
  resources :teams do
    resources :assings, only: %i[ create destroy ]
  end
  resources :users, only: :show
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'user/show'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
