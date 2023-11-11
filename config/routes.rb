Rails.application.routes.draw do

  get "/" => "home#index"
  get "/sign_up" => "cadastro#new"
  post "/sign_up/:tipo" => "cadastro#create"
  get "/sign_in" => "sessions#new"
  post "/sign_in" => "sessions#create"
  delete "/logout" => "sessions#destroy"

end
