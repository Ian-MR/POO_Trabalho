class CreateAtividadeAlunos < ActiveRecord::Migration[7.1]
  def change
    create_table :atividade_alunos do |t|
      t.boolean :validada
      t.references :aluno, null: false, foreign_key: true
      t.references :atividade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
