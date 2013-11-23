League::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :summoners
  end
  get "/users/:user_id/summoners(.:format)", to:"summoners#index", as: :summoners
  post "/users/:user_id/summoners(.:format)", to: "summoners#create"
  get "/users/:user_id/summoners/new(.:format)", to: "summoners#new", as: :new_summoner
  get "/users/:user_id/summoners/:id/edit(.:format)", to: "summoners#edit", as: :edit_summoner
  get "/users/:user_id/summoners/:id(.:format)", to: "summoners#show", as: :user_summoner
  put "/users/:user_id/summoners/:id(.:format)", to: "summoners#update"
  delete "/users/:user_id/summoners/:id(.:format)", to: "summoners#destroy"
end