class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @usuario = Usuario.find_by(email: params[:email])
        if @usuario.present?
            PasswordMailer.with(usuario: @usuario).reset.deliver_later
        end
        redirect_to root_path
    end

    def edit
        @usuario = Usuario.find_signed!(params[:token],purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path
    end

    def update
        @usuario = Usuario.find_signed!(params[:token],purpose: "password_reset")
        if @usuario.update(password_params)
            redirect_to sign_in_path
        else
            render :edit
        end
    end

    private
    def password_params
        params.require(:usuario).permit(:password, :password_confirmation)
    end
end