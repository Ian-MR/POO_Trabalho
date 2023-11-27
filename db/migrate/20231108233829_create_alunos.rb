class CreateAlunos < ActiveRecord::Migration[7.1]
  def change
    create_table :alunos do |t|
      t.string :curso
      t.integer :horas_I
      t.integer :horas_II
      t.integer :horas_III
      t.integer :horas_IV

      t.timestamps
    end
  end
end
