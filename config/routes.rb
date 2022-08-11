Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'homes#show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
