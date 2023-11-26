# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_25_232519) do
  create_table "alunos", force: :cascade do |t|
    t.string "curso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atividade_alunos", force: :cascade do |t|
    t.boolean "validada"
    t.integer "aluno_id", null: false
    t.integer "atividade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_atividade_alunos_on_aluno_id"
    t.index ["atividade_id"], name: "index_atividade_alunos_on_atividade_id"
  end

  create_table "atividades", force: :cascade do |t|
    t.string "titulo"
    t.string "descricao"
    t.integer "modalidade"
    t.string "tipo"
    t.integer "carga_horaria"
    t.integer "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id"], name: "index_atividades_on_professor_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "centro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "matricula"
    t.string "telefone"
    t.string "password_digest"
    t.string "userable_type"
    t.integer "userable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "atividade_alunos", "alunos"
  add_foreign_key "atividade_alunos", "atividades"
  add_foreign_key "atividades", "professors"
end
