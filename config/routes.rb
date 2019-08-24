Rails.application.routes.draw do
  get 'users/show'
  root 'words#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  resources :users, only: [:show]

  resources :words do
  end
end
