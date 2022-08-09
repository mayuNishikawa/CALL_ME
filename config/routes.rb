Rails.application.routes.draw do
  devise_for :users
  root 'rooms#show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
