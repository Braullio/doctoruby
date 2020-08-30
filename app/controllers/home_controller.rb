# frozen_string_literal: true

# Controller to Doctors
class HomeController < ApplicationController
  def index
    search = params['doctor_id'].blank? ? search_doctor_nil : search_doctor_present

    @quantity_appointments = search.size
    @quantity_patients     = search.pluck(:patient_id).uniq.size
    @doctor_dashboard_id   = params['doctor_id']
  end

  private

  def search_doctor_nil
    Appointment.where("starts_at > '#{Time.now}'")
  end

  def search_doctor_present
    Appointment.where("starts_at > '%#{Time.now}%' and doctor_id = #{params['doctor_id']}")
  end
end
