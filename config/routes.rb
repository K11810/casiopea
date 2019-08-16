Rails.application.routes.draw do
  devise_for :users
  root 'words#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :words do
  end
end
