Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :labels
  resources :users, path: :managers do
    member do
      put 'active'
      put 'unactive'
    end
    collection do
      put 'activeall'
      put 'unactiveall'
    end
  end
  resources :pictures
  root "articles#index"
end
