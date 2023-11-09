class CadastroController < ApplicationController
    def aluno
        @aluno = Aluno.new
        @aluno.usuario = Usuario.new
    end
    def professor
        @professor = Professor.new
        @professor.usuario = Usuario.new
    end
    def createAluno
        data = params[:aluno]
        @aluno = Aluno.new(curso: data[:curso])
        @aluno.save
        data = params[:usuario]
        @usuario = Usuario.new({nome: data[:nome], email: data[:email], matricula: data[:matricula],telefone: data[:telefone], senha: data[:senha], userable: @aluno})
        @usuario.save
    end
    def createProfessor
        data = params[:professor]
        @professor = Professor.new(centro: data[:centro])
        @professor.save
        data = params[:usuario]
        @usuario = Usuario.new({nome: data[:nome], email: data[:email], matricula: data[:matricula],telefone: data[:telefone], senha: data[:senha], userable: @professor})
        @usuario.save
    end
end