class CreateAlunos < ActiveRecord::Migration[7.1]
  def change
    create_table :alunos do |t|
      t.string :curso
      t.integer :horas_I, default: 0
      t.integer :horas_II, default: 0
      t.integer :horas_III, default: 0
      t.integer :horas_IV, default: 0

      t.timestamps
    end
  end
end
