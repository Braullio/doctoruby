# frozen_string_literal: true

# Interaction table patient
class Patient < ApplicationRecord
  belongs_to :doctor

  has_many :appointments

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :cpf, presence: true, numericality: { only_integer: true }
  validates :doctor_id, presence: true
  validates :cpf, uniqueness: true
end
