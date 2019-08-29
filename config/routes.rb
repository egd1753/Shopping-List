Rails.application.routes.draw do
  root 'welcome#index'

  resources :lists do
    resources :items
  end
  
end
