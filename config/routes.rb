Rails.application.routes.draw do
	resources :follows do 
		collection do
		  post 'follow_user'
		  post 'unfollow_user'
		  post 'follow_topic'
		  post 'unfollow_topic'
		end
	end
	resources :answers
	resources :topics
	resources :questions

	devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
	devise_scope :user do
		get "signup", to: "users/registrations#new"
		get "login", to: "users/sessions#new"
		get "logout", to: "users/sessions#destroy"
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
