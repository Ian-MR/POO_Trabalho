class SessionsController < ApplicationController
    def new
        @login_erro = false
    end
    def create
        usuario = Usuario.find_by(email: params[:email])
        if usuario.present? && usuario.authenticate(params[:password])
            session[:usuario_id] = usuario.id
            redirect_to "/"
        else
            @login_erro = true
            render :new
        end
    end
    def destroy
        session[:usuario_id] = nil
        redirect_to "/"
    end
end