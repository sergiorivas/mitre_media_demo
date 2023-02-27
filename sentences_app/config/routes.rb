Rails.application.routes.draw do
  resources :sentences, only: [:new, :create, :edit, :update, :index, :destroy]
  resources :sentence_parts, only: [:update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sentences#index"
end
