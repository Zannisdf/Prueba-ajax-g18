Rails.application.routes.draw do
  devise_for :users
  resources :companies, only: %i[index new create]
  root 'companies#index'
end
