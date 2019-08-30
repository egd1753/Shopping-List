Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :lists do
    resources :items
  end
  
end
