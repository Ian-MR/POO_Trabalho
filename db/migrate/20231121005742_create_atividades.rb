class CreateAtividades < ActiveRecord::Migration[7.1]
  def change
    create_table :atividades do |t|
      t.string :titulo
      t.string :descricao
      t.integer :modalidade
      t.string :tipo
      t.integer :carga_horaria
      t.references :professor, foreign_key: true
      

      t.timestamps
    end
  end
end
