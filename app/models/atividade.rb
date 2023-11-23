class Atividade < ApplicationRecord
    belongs_to :professor
    has_and_belongs_to_many :alunos

    attr_reader :horas

    def cargaHoraria
        @horas = {
            PAP: 100,
            PDP: 50
        }
    end

end
