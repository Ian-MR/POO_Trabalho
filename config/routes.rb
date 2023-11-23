Rails.application.routes.draw do

  get "/" => "home#index", as: 'root'

  get "/sign_up" => "cadastro#new"
  post "/sign_up/:tipo" => "cadastro#create"

  get "/sign_in" => "sessions#new"
  post "/sign_in" => "sessions#create"

  get "/password" => "passwords#edit"
  patch "/password" => "passwords#update"

  get "/password/reset" => "password_resets#new"
  post "/password/reset" => "password_resets#create"
  get "/password/reset/edit" => "password_resets#edit"
  patch "/password/reset/edit" => "password_resets#update"

  get "/atividade/cadastro" => "cadastro_atividades#new"
  post"/atividade/cadastro" => "cadastro_atividades#create"

  delete "/logout" => "sessions#destroy"

end
