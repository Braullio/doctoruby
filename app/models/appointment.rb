# frozen_string_literal: true

# Interaction table Appointment
class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :patient_id, presence: true
  validates :doctor_id, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validates :starts_at, uniqueness: { scope: :doctor_id, message: 'não pode repetir o horário!' }
  validates :ends_at, uniqueness: { scope: :doctor_id, message: 'não pode repetir o horário!' }
end
