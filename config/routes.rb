Rails.application.routes.draw do
  root "static#index"
  resources :recipes
  resources :users
  resources :comments
  resources :bookmarks

  post "/sessions" => "sessions#create"
  get "/sign_in" => "sessions#new", as: 'new_session'
  get "/profile" => "users#profile"
  get "/log_out" => "sessions#destroy"
end
