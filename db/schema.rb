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

ActiveRecord::Schema[7.1].define(version: 20_241_002_154_829) do
  create_table 'expenses', force: :cascade do |t|
    t.string 'name'
    t.float 'expense_value'
    t.integer 'category', default: 0
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'month'
    t.integer 'year'
    t.index ['user_id'], name: 'index_expenses_on_user_id'
  end

  create_table 'goals', force: :cascade do |t|
    t.integer 'fixed_cost'
    t.integer 'comfort'
    t.integer 'goals'
    t.integer 'pleasures'
    t.integer 'financial_freedom'
    t.integer 'knowledge'
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_goals_on_user_id'
  end

  create_table 'incomes', force: :cascade do |t|
    t.float 'monthly_income'
    t.integer 'month'
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'year'
    t.index ['user_id'], name: 'index_incomes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'expenses', 'users'
  add_foreign_key 'goals', 'users'
  add_foreign_key 'incomes', 'users'
end
