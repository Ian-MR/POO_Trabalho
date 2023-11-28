class CoordenadorController < ApplicationController
    before_action :require_user_logged_in!, :require_coordenador
    def show
        @alunos = Aluno.where(curso: Current.usuario.userable.curso) if Current.usuario.userable.present?
        @alunos.each do |aluno|
            Atividade.new.verificarHoras(aluno)
        end
    end
    private
    def require_coordenador
        redirect_to root_path unless Current.usuario&.userable_type == "Professor" && Current.usuario.userable&.coordenador
    end
end