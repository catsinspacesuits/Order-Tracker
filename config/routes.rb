Rails.application.routes.draw do
  devise_for :users
	resources :orders
	root 'orders#index'
	resources :users, only: [] do
	  resources :orders, module: :users, only: :index
	end
end
