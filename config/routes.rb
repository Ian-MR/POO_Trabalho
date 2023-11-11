Rails.application.routes.draw do

  get "/" => "home#index"
  get "/sign_up" => "cadastro#new"
  post "/sign_up/:tipo" => "cadastro#create"

end
