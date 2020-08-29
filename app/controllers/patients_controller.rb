# frozen_string_literal: true

# Controller to Doctors
class PatientsController < ApplicationController
  before_action :patient, only: %i[update destroy]

  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to root_path, notice: 'Paciente criado com sucesso!' }
      else
        format.html { redirect_to root_path, alert: @patient.errors.full_messages.to_sentence }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to root_path, notice: 'Paciente atualizado com sucesso!' }
      else
        format.html { redirect_to root_path, alert: @patient.errors.full_messages.to_sentence }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @patient.destroy
        format.html { redirect_to root_path, notice: 'Paciente deletado com sucesso!' }
      else
        format.html { redirect_to root_path, alert: @patient.errors.full_messages.to_sentence }
      end
    end
  end

  private

  def patient
    @patient = patient_find
  end

  def patient_find
    params[:id].eql?('patient') ? patient_params_update : Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :birth_date, :cpf, :doctor_id)
  end

  def patient_params_update
    params['patient'].merge!(birth_date: patient_params_birth_date)
    Patient.find(params[:patient][:id])
  end

  def patient_params_birth_date
    "#{params['Data de Nascimento']['(1i)']}-#{params['Data de Nascimento']['(2i)']}-#{params['Data de Nascimento']['(3i)']}".to_date
  end
end
