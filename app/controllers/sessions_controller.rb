class SessionsController < ApplicationController
    def new
        @login_erro = false
    end
    def create
        usuario = Usuario.find_by(email: params[:email])
        if usuario.present? && usuario.authenticate(params[:password])
            session[:usuario_id] = usuario.id
            redirect_to root_path
        else
            flash[:alert] = "E-mail ou senha incorreto!"
            render :new
        end
    end
    def destroy
        session[:usuario_id] = nil
        redirect_to root_path
    end
end