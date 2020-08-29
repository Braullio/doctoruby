# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  describe 'Controller' do
    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new patient' do
          expect do
            post :create, params: patient_params
          end.to change(Patient, :count).by(1)
        end

        it 'redirects to the created patient' do
          post :create, params: patient_params
          expect(response).to redirect_to(root_path)
        end
      end

      context 'with invalid params' do
        it 'returns a success response (i.e. to display the "new" template)' do
          expect do
            post :create, params: { patient: {
                                    name: '',
                                    birth_date: '',
                                    cpf: '',
                                    doctor_id: ''
                                  } }
          end.to change(Patient, :count).by(0)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        it 'updates the requested patient' do
          patch :update, params: { id: create_patient.id, patient: { name: Faker::FunnyName.name } }
          expect(Patient.count).to eq(1)
        end

        it 'redirects to the patient' do
          patch :update, params: { id: create_patient.id, patient: { name: Faker::FunnyName.name } }
          expect(response).to redirect_to(root_path)
        end
      end

      context 'with invalid params' do
        it 'returns a success response (i.e. to display the "edit" template)' do
          expect{
            put :create, params: { id: create_patient.id, patient: {
                                                            name: '',
                                                            birth_date: '',
                                                            cpf: '',
                                                            doctor_id: ''
                                                          } }
          }.to change(Patient, :count).by(1)
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested patient' do
        delete :destroy, params: { id: create_patient.id }
        expect(Patient.count).to eq(0)
      end

      it 'redirects to the patients list' do
        delete :destroy, params: { id: create_patient.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  def create_doctor
    create(:doctor)
  end

  def create_patient
    create(:patient)
  end

  def patient_params
    { patient: {
      name: Faker::FunnyName.name,
      birth_date: Faker::Date.birthday,
      cpf: Faker::CPF.number,
      doctor_id: create_doctor.id
    } }
  end
end
