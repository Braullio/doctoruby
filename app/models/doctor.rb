# frozen_string_literal: true

# Interaction table doctor
class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :crm, presence: true, numericality: { only_integer: true }
  validates :crm_uf, presence: true
  validates :crm, uniqueness: { scope: :crm_uf, message: 'não pode repetir na mesma UF!' }
end
