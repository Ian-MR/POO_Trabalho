class Usuario < ApplicationRecord
    belongs_to :userable, polymorphic: true
end
