# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141029123411) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "equipment", :force => true do |t|
    t.integer  "dane_sede"
    t.string   "tipo"
    t.string   "origen"
    t.date     "fecha_entrega"
    t.string   "nombre"
    t.string   "fabricante"
    t.string   "modelo"
    t.string   "serial"
    t.string   "procesador"
    t.string   "memoria_ram"
    t.string   "disco_duro"
    t.string   "display"
    t.string   "sist_operativo"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "municipios", :force => true do |t|
    t.integer  "cod_municipio"
    t.string   "nombre_municipio"
    t.string   "cod_subregion"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "principal_establecs", :force => true do |t|
    t.integer  "dane_establec"
    t.string   "localidad"
    t.string   "rector"
    t.string   "nombre"
    t.string   "zona"
    t.string   "calendario"
    t.string   "jornada"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "correo"
    t.integer  "cod_municipio"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sedes", :force => true do |t|
    t.integer  "dane_sede"
    t.integer  "dane_establec"
    t.string   "localidad"
    t.string   "nombre"
    t.string   "zona"
    t.string   "calendario"
    t.string   "jornada"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "correo"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "subregions", :force => true do |t|
    t.integer  "cod_subregion"
    t.string   "nombre_subregion"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "nombre_programa"
    t.string   "entidad_ejecutora"
    t.string   "fase"
    t.string   "fecha_entrega"
    t.string   "responsable"
    t.integer  "cantidad"
    t.text     "observaciones"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "superadmin",             :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
