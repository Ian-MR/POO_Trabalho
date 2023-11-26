class HomeController < ApplicationController
    before_action :require_user_logged_in!
    def index
        @atividades = Current.usuario.userable.atividades
    end
end