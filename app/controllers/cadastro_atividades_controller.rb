class CadastroAtividadesController < ApplicationController
    before_action :require_user_logged_in!
    def new
        if Current.usuario.userable_type == "Professor"
            @atividade = Atividade.new
        else
            redirect_to root_path
        end
    end

    def create

    end
end