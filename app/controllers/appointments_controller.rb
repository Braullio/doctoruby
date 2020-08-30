# frozen_string_literal: true

# Controller to Appointments
class AppointmentsController < ApplicationController
  before_action :appointment, only: %i[update destroy]

  def index
    @date                 = search_data_index
    @doctor_appointment   = search_doctor_index
    @patients_appointment = @doctor_appointment.patients

    @appointments = Appointment.where("starts_at like '%#{@date}%' and doctor_id = #{@doctor_appointment.id}").order(:starts_at)
    @appointment  = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { 
          redirect_to appointments_path(
            data: {
              '(1i)': params[:day].split('/')[2],
              '(2i)': params[:day].split('/')[1],
              '(3i)': params[:day].split('/')[0]
            }, appointment: { doctor_id: params['appointment']['doctor_id'] }
          ), notice: 'Agendamento criado com sucesso!'
        }
      else
        format.html {
          redirect_to appointments_path(
            data: {
              '(1i)': params[:day].split('/')[2],
              '(2i)': params[:day].split('/')[1],
              '(3i)': params[:day].split('/')[0]
            }, appointment: { doctor_id: params['appointment']['doctor_id'] }
          ), alert: @appointment.errors.full_messages.to_sentence }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html {
          redirect_to appointments_path(
            data: {
              '(1i)': params[:day].split('/')[2],
              '(2i)': params[:day].split('/')[1],
              '(3i)': params[:day].split('/')[0]
            }, appointment: { doctor_id: params['appointment']['doctor_id'] }
          ), notice: 'Agendamento atualizado com sucesso!' }
      else
        format.html {
          redirect_to appointments_path(
            data: {
              '(1i)': params[:day].split('/')[2],
              '(2i)': params[:day].split('/')[1],
              '(3i)': params[:day].split('/')[0]
            }, appointment: { doctor_id: params['appointment']['doctor_id'] }
          ), alert: @appointment.errors.full_messages.to_sentence }
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

  def search_data_index
    return Date.today unless params['data']

    "#{params['data']['(1i)']}-#{params['data']['(2i)']}-#{params['data']['(3i)']}".to_date
  end

  def search_doctor_index
    return Doctor.order(:name).first unless params['data']

    Doctor.find(params['appointment']['doctor_id'])
  end
end
