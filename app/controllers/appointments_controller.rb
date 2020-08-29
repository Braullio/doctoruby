# frozen_string_literal: true

# Controller to Appointments
class AppointmentsController < ApplicationController
  before_action :appointment, only: %i[show edit update destroy]

  def index
    @appointments = Appointment.all
  end

  def show; end

  def new
    @appointment = Appointment.new
  end

  def edit; end

  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Agendamento criado com sucesso!' }
      else
        format.html { redirect_to appointments_url, alert: @doctor.errors.full_messages.to_sentence }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment atualizado com sucesso!' }
      else
        format.html { redirect_to appointments_url, alert: @doctor.errors.full_messages.to_sentence }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      if @doctor.destroy
        format.html { redirect_to appointments_url, notice: 'Agendamento deletado com sucesso!' }
      else
        format.html { redirect_to appointments_url, alert: @doctor.errors.full_messages.to_sentence }
      end
    end
  end

  private

  def appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:starts_at, :ends_at, :doctor_id, :patient_id)
  end
end
