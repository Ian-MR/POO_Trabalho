class Atividade < ApplicationRecord
    belongs_to :professor
    has_many :atividade_aluno, dependent: :destroy
    has_many :alunos, through: :atividade_aluno

    validates :titulo, presence: true
    validates :descricao, presence: true
    validates :modalidade, presence: true
    validates :tipo, presence: true
    validates :alunos, presence: true
    @carga_horaria = 0
    @carga_maxima = 200

    def self.carga_horaria
        @carga_horaria 
    end

    def self.carga_maxima
        @carga_maxima
    end

    def validarAluno?(matricula_aluno, tipo_atividade, modalidade_atividade, modelo)
        aluno = Usuario.find_by(matricula: matricula_aluno).userable
        hora = 0
        hora_maxima = 0
        verificarHoras(aluno)
        case modalidade_atividade
        when "1"
            hora_maxima = aluno.horas_I 
        when "2"
            hora_maxima = aluno.horas_II
        when "3"
            hora_maxima = aluno.horas_III
        when "4"
            hora_maxima = aluno.horas_IV
        end
        if (hora_maxima + modelo[:carga_horaria]) <=200
            ativs= AtividadeAluno.joins(:atividade).where(aluno_id: aluno.id ,validada: true, atividades: { tipo: tipo_atividade })
            ativs.each do |ativ|
                hora += Atividade.find(ativ.atividade_id).carga_horaria
            end
        end
        verificarHoras(aluno) 
        hora < modelo.class.carga_maxima && (hora_maxima + modelo[:carga_horaria]) <= 200
    end

    def verificarHoras(aluno)
        hora_total=[0,0,0,0]
        ativs= AtividadeAluno.where(aluno_id: aluno.id ,validada: true)
        ativs.each do |ativ|
            hora_total[Atividade.find(ativ.atividade_id).modalidade - 1] += Atividade.find(ativ.atividade_id).carga_horaria
        end
        aluno.update({horas_I: hora_total[0],horas_II: hora_total[1],horas_III: hora_total[2],horas_IV: hora_total[3]})
    end

end
