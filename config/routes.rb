require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :articles do
		resources :comments
		member do
			put 'add_vote'
			put 'favorating'
			put 'unfavorating'
		end
		collection do
			get 'descending'
			get 'ascending'
			get 'up'
			get 'down'
			get 'timeup'
			get 'timedown'
		end
	end
	resources :labels
	mount Sidekiq::Web => 'sidekiq／cron'
	resources :users, path: :managers do
		member do
			put 'active'
			put 'unactive'
			put 'sign_in'
		end
		collection do
			put 'activeall'
			put 'unactiveall'
		end
	end
	resources :favorites, only: [:index]
	resources :pictures
	resources :messages
	root "articles#index"
	namespace :account do
   resources :comments
	 resources :articles
  end
end
