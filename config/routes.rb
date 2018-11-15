Rails.application.routes.draw do
  devise_for :users
	resources :orders
	root 'orders#index'
end
