Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'packs#index'
  resources :packs, only: %i[new update show edit create] do
    resources :features, only: %i[index new create update edit]
  end

  resources :clients, only: %i[new edit create update]
end
