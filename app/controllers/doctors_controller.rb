# frozen_string_literal: true

# Controller to Doctors
class DoctorsController < ApplicationController
  before_action :doctor, only: %i[update destroy]

  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to root_path, notice: 'Doutor criado com sucesso!' }
      else
        format.html { redirect_to root_path, alert: @doctor.errors.full_messages.to_sentence }
      end
    end
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to root_path, notice: 'Doutor atualizado com sucesso!' }
      else
        format.html { redirect_to root_path, alert: @doctor.errors.full_messages.to_sentence }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @doctor.destroy
        format.html { redirect_to root_path, notice: 'Doutor deletado com sucesso!' }
      else
        format.html { redirect_to root_path, alert: @doctor.errors.full_messages.to_sentence }
      end
    end
  end

  private

  def doctor
    @doctor = doctor_find
  end

  def doctor_find
    params[:id].eql?('doctor') ? Doctor.find(params[:doctor][:id]) : Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :crm, :crm_uf)
  end
end
