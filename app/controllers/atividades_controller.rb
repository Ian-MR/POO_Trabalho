class AtividadesController < ApplicationController
    before_action :require_user_logged_in!
    def show
        @atividade = Atividade.find_by(id: id_param)
    end

    def edit 
        if Current.usuario.userable == Atividade.find_by(id: id_param).professor
            @atividade = Atividade.find_by(id: id_param)
        else
            redirect_to root_path
        end
    end

    def update
        @atividade = Atividade.find_by(id: id_param)
        alunos = []
        alunos_parms[:alunos].each do |aluno|
            alunos.push(Usuario.find_by(matricula:aluno).userable)
        end
        if @atividade.update(atividade_params.merge({alunos: alunos}))
            alunos.each do |aluno|
                x = AtividadeAluno.where(atividade_id: @atividade.id, aluno_id: aluno.id).first
                x.validada = @atividade.validarAluno?(aluno.usuario.matricula,@atividade.tipo,@atividade.modalidade, @atividade)
                x.save
            end
            redirect_to atividade_path(id: @atividade.id)
        else
            render :edit
        end
    end

    def destroy
        @atividade = Atividade.find_by(id: id_param)
        alunos = @atividade.alunos
        if @atividade && Current.usuario.userable == @atividade.professor
            @atividade.destroy
            alunos.each do |aluno|
                Atividade.new.verificarHoras(aluno)
            end
        end
        redirect_to root_path
    end
    

    private
    def id_param
        params.require(:id)
    end

    def atividade_params
        params.require(:atividade).permit(:titulo, :descrição)
    end
    def alunos_parms
        params.require(:atividade).permit(alunos:[])
    end
end