Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :gift_lists
  post 'dashboard/change_default_gift_list', to: 'dashboard#change_default_gift_list'
  post 'gift_lists/add_item', to: 'gift_lists#add_item'

	devise_scope :user do
	  authenticated :user do
	    root 'dashboard#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end
end
