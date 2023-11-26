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
        case atividade_params[:tipo]
        when "colaboracao"
           @atividade = Colaboracao.new(atividadeParams.merge({carga_horaria: Colaboracao.carga_horaria}))
            
        when "contribuicao"
            @atividade = Contribuicao.new(atividadeParams.merge({carga_horaria: Contribuicao.carga_horaria}))
            
        when "coordenacao"
            @atividade = Coordenacao.new(atividadeParams.merge({carga_horaria: Coordenacao.carga_horaria}))
            
        when "divulgacao"
            @atividade = Divulgacao.new(atividadeParams.merge({carga_horaria: Divulgacao.carga_horaria}))
            
        when "participacao"
            @atividade = Participacao.new(atividadeParams.merge({carga_horaria: Participacao.carga_horaria}))
            
        when "formacao"
            @atividade = Formacao.new(atividadeParams.merge({carga_horaria: Formacao.carga_horaria}))

        when "auxilio"
            @atividade = Auxilio.new(atividadeParams.merge({carga_horaria: Auxilio.carga_horaria}))

        when "orientacao"
            @atividade = Orientacao.new(atividadeParams.merge({carga_horaria: Orientacao.carga_horaria}))

        when "interatividade"
            @atividade = Interatividade.new(atividadeParams.merge({carga_horaria: Interatividade.carga_horaria}))

        when "criacao"
            @atividade = Criacao.new(atividadeParams.merge({carga_horaria: Criacao.carga_horaria}))

        when "organizacao"
            @atividade = Organizacao.new(atividadeParams.merge({carga_horaria: Organizacao.carga_horaria}))

        else
            @atividade = Atividade.new(atividadeParams)
        end

        Current.usuario.userable.atividades << @atividade

        atividade_params[:alunos].each do |mat|
            aluno = Usuario.find_by(matricula: mat)
            if aluno
                @atividade.alunos << aluno.userable
                x = AtividadeAluno.where(atividade_id: @atividade.id, aluno_id: aluno.userable_id).first
                x.validada = @atividade.validarAluno?(aluno.matricula,atividade_params[:tipo])
                x.save
            end
        end
        if @atividade.save
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def atividade_params
        params.require(:atividade).permit(:titulo, :descricao, :modalidade, :tipo, :carga_horaria, alunos: [])
    end

    def atividadeParams
       ativ = atividade_params
       ativ.delete(:alunos)
       ativ
    end

end