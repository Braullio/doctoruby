# frozen_string_literal: true

# Create doctor table
class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :crm
      t.string :crm_uf

      t.timestamps
    end
  end
end
