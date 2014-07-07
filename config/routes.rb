DataDirector::Application.routes.draw do
  
  devise_for :users
  
  resources :supporters
  
  root 'supporters#index'
  
end
