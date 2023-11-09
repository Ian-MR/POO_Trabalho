Rails.application.routes.draw do

  get "/" => "home#index"
  get "/sign_up/professor" => "cadastro#professor"
  post "/sign_up/professor" => "cadastro#createProfessor"
  get "/sign_up/aluno" => "cadastro#aluno"
  post "/sign_up/aluno" => "cadastro#createAluno"
  

end
