# frozen_string_literal: true

# Helper from partial
module PatientsHelper
  def all_patients
    Patient.all.order(:name)
  end

  def patient_new
    Patient.new
  end
end
