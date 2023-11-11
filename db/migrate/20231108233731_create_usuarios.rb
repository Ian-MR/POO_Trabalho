class CreateUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :matricula
      t.string :telefone
      t.string :password_digest
      t.string :userable_type
      t.integer :userable_id

      t.timestamps
    end
  end
end
