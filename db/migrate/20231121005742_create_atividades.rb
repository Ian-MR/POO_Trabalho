class CreateAtividades < ActiveRecord::Migration[7.1]
  def change
    create_table :atividades do |t|
      t.string :titulo
      t.string :descricao
      t.integer :modalidalidade
      t.string :tipo
      t.integer :carga_horaria

      t.timestamps
    end
  end
end
