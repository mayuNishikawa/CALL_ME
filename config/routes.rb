Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'user/show'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'homes#show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
