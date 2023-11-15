class HomeController < ApplicationController
    before_action :require_user_logged_in!
    def index
        case  Current.usuario.userable_type
        when "Aluno"
            @msg = "Olá, "
        when "Professor"
            @msg = "Bem Vindo, "
        end
    end
end