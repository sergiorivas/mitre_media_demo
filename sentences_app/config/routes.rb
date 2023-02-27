Rails.application.routes.draw do
  resources :sentences, only: [:new, :create, :edit, :update, :index, :destroy]
  resources :sentence_parts, only: [:update]

  root "sentences#index"
end
