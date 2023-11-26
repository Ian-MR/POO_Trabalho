class Atividade < ApplicationRecord
    belongs_to :professor
    has_many :atividade_aluno
    has_many :alunos, through: :atividade_aluno
    @@carga_horaria = 0
    @@carga_maxima = 200
    def self.carga_horaria
        @@carga_horaria 
    end
    def self.carga_maxima
        @@carga_maxima
    end

    def validarAluno?(matricula_aluno, tipo_atividade)
        aluno = Usuario.find_by(matricula: matricula_aluno).userable_id
        hora = 0
        ativs= AtividadeAluno.joins(:atividade).where(aluno_id: aluno ,validada: true, atividades: { tipo: tipo_atividade })
        ativs.each do |ativ|
            hora += Atividade.find(ativ.atividade_id).carga_horaria
        end
        hora < @@carga_maxima
    end
end
