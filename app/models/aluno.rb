class Aluno < ApplicationRecord
    has_one :usuario, as: :userable 
    accepts_nested_attributes_for :usuario
    has_and_belongs_to_many :atividades
end
