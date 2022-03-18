Rails.application.routes.draw do
  resources :profiles, only: %i[show index]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :comments
  resources :dogruns do
    collection do
      get 'search'
      get 'top'
    end
  end
  root to: 'dogruns#top'
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
