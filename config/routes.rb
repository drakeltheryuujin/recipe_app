Rails.application.routes.draw do
  resources :shopping_lists
  root "static#index"
  resources :recipes
  resources :users
  resources :bookmarks
  resources :line_items

  post "/sessions" => "sessions#create"
  get "/sign_in" => "sessions#new", as: 'new_session'
  get "/profile" => "users#profile"
  get "/profile/shopping_list" => "shopping_lists#show"
  get "/log_out" => "sessions#destroy"
end
