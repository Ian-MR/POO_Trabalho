class AtividadeAluno < ApplicationRecord
    belongs_to :aluno
    belongs_to :atividade
end