Rails.application.routes.draw do

  root 'homes#top'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :users, only: [:show]

  get 'homes/about'

  resources :words do
  end
end
