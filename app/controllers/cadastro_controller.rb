class CadastroController < ApplicationController
    def new
        
    end
    def create
        case params[:tipo].downcase
        when "aluno"
            @aluno = Aluno.new(params_aluno)
            @usuario = Usuario.new(params_usuario.merge({userable: @aluno}))
            if @usuario.save && @aluno.save
                session[:usuario_id] = @usuario.id
                redirect_to "/"
            else
                redirect_to :new
            end
        when "professor"
            @professor = Professor.new(params_professor)
            @usuario = Usuario.new(params_usuario.merge({userable: @professor}))
            if @usuario.save && @professor.save
                session[:usuario_id] = @usuario.id
                redirect_to "/"
            else
                redirect_to :new
            end
        else
            redirect :new
        end
    end

    private

    def params_usuario
        params.require(:usuario).permit(:nome,:email,:matricula,:telefone,:password, :password_confirmation)
    end
    def params_aluno
        params.require(:aluno).permit(:curso)
    end
    def params_professor
        params.require(:usuario).permit(:centro)
    end
end