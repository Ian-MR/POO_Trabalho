class HomeController < ApplicationController
def index
    if !Current.usuario
        redirect_to sign_in_path
    else
        case  Current.usuario.userable_type
        when "Aluno"
            @msg = "Olá, "
        when "Professor"
            @msg = "Bem Vindo, "
        end
    end
end
end