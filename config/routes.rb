League::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :summoners

  # get "/users/:user_id/summoners(.:format)", to:"summoners#index", as: :summoners
  # post "/users/:user_id/summoners(.:format)", to: "summoners#create", as: :summoners
  # get "/users/:user_id/summoners/new(.:format)", to: "summoners#new", as: :new_summoner
  # get "/users/:user_id/summoners/:id/edit(.:format)", to: "summoners#edit", as: :edit_summoner
  # get "/users/:user_id/summoners/:id(.:format)", to: "summoners#show", as: :summoner
  # put "/users/:user_id/summoners/:id(.:format)", to: "summoners#update", as: :summoner
  # delete "/users/:user_id/summoners/:id(.:format)", to: "summoners#destroy", as: :summoner
end