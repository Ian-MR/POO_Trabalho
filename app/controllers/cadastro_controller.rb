class CadastroController < ApplicationController
    
    def new
        
    end
    def create
        case params[:tipo].downcase
        when "aluno"
            @aluno = Aluno.new(params_aluno)
            @usuario = @aluno.build_usuario(params_usuario)
            @usuario.userable = @aluno
            #@usuario = Usuario.new(params_usuario.merge({userable: @aluno}))
            if @usuario.save && @aluno.save
                session[:usuario_id] = @aluno.usuario.id
                redirect_to root_path
            else
                puts @aluno.errors.full_messages
                puts @usuario.errors.full_messages
                puts @usuario.userable
                render :new
            end
        when "professor"
            @professor = Professor.new(params_professor)
            @usuario = Usuario.new(params_usuario.merge({userable: @professor}))
            if @usuario.save && @professor.save
                session[:usuario_id] = @usuario.id
                redirect_to root_path
            else   
                render :new
            end
        else
            render :new
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
        params.require(:professor).permit(:centro)
    end
end