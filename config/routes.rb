Rails.application.routes.draw do
  root 'rooms#show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
