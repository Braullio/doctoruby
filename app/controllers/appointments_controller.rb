# frozen_string_literal: true

# Controller to Appointments
class AppointmentsController < ApplicationController
  before_action :appointment, only: %i[update destroy]

  def index
    @date = Date.today
    @appointments = Appointment.where("starts_at like '%#{@date}%'").order(:starts_at)
    @appointment  = Appointment.new
    @doctor_appointment   = Doctor.find(17)
    @patients_appointment = @doctor_appointment.patients
  end

  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointments_url, notice: 'Agendamento criado com sucesso!' }
      else
        format.html { redirect_to appointments_url, alert: @appointment.errors.full_messages.to_sentence }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointments_url, notice: 'Agendamento atualizado com sucesso!' }
      else
        format.html { redirect_to appointments_url, alert: @appointment.errors.full_messages.to_sentence }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      if @appointment.destroy
        format.html { redirect_to appointments_url, notice: 'Agendamento deletado com sucesso!' }
      else
        format.html { redirect_to appointments_url, alert: @appointment.errors.full_messages.to_sentence }
      end
    end
  end

  private

  def appointment
    @appointment = appointment_find
  end

  def appointment_find
    params[:id].eql?('appointment') ? Appointment.find(params[:appointment][:id]) : Appointment.find(params[:id])
  end

  def appointment_params
    merge_start_ends
    params.require(:appointment).permit(:starts_at, :ends_at, :doctor_id, :patient_id)
  end

  def merge_start_ends
    merge_starts
    merge_ends
  end

  def merge_starts
    params['appointment'].merge!(starts_at: (params['day'] + ' ' + params['hour']).to_time)
  end

  def merge_ends
    params['appointment'].merge!(ends_at: (params['day'] + ' ' + params['hour']).to_time + 1800)
  end
end
