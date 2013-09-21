Crackle::Application.routes.draw do
  devise_for :users

  get "/users" => "home#users"
  root "home#index"

end
