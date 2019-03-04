Rails.application.routes.draw do
  devise_for :users
  resources :companies do
    resources :complaints, only: :create
  end
  root 'companies#index'
end
