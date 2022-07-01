Rails.application.routes.draw do

  root 'splash_screen#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/user' => 'categories#index'


  devise_for :users

  resources :splash_screen, :categories, :transactions
end
