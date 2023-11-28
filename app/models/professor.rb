class Professor < ApplicationRecord
    has_one :usuario, as: :userable 
    accepts_nested_attributes_for :usuario
    has_many :atividades
    before_save :coordenador?

    validates :centro, presence:true
end
