Rails.application.routes.draw do

  root 'splash_screen#index'

  devise_for :users

  resources :splash_screen, :categories
end
