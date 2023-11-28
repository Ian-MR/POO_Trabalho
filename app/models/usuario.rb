class Usuario < ApplicationRecord
    has_secure_password
    belongs_to :userable, polymorphic: true

    validates :nome, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :matricula, presence: true, uniqueness: true
    validates :telefone, presence: true, uniqueness: true
end
