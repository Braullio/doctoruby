# frozen_string_literal: true

ActiveRecord::Schema.define(version: 2020_08_28_025307) do
  create_table 'doctors', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.string 'name'
    t.string 'crm'
    t.string 'crm_uf'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
