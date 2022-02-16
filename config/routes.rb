Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  resources :comments
  resources :users
  resources :dogruns do
    collection do
      get 'search'
      get 'top'
    end
  end
  root to: "dogruns#top"
  post '/users/guest_sign_in', to: 'users#new_guest'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
