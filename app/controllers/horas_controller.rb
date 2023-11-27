class HorasController < ApplicationController
    before_action :require_user_logged_in!
    def show
        Atividade.new.verificarHoras(Current.usuario.userable)
        @atividades = Current.usuario.userable.atividades
    end
end