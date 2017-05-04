Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :categories do
  	resources :foods do
  		member do
  			get 'add_to_cart'
  		end
  	end
  end

  resources :orders do
    collection do
  		get 'my_cart'
      post 'buy_now'
  	end
  end

end
