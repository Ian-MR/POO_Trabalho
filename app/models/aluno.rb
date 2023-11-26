class Aluno < ApplicationRecord
    has_one :usuario, as: :userable 
    accepts_nested_attributes_for :usuario
    has_many :atividade_aluno
    has_many :atividades, through: :atividade_aluno
end
