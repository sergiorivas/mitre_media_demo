Rails.application.routes.draw do
  resources :sentences
  resources :sentence_parts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sentences#index"
end
