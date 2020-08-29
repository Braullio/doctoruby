require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'Model' do
    it 'is valid with valid attributes' do
      expect(create_patient).to be_valid
    end

    it 'is not valid because cannot repeat CPF' do
      patient_new = create_patient.dup
      expect(patient_new).to_not be_valid
    end

    it 'is not valid without a CPF' do
      patient = build(:patient, cpf: '')
      expect(patient).to_not be_valid
    end

    it 'not valid with a non-numeric cpf' do
      patient = build(:patient, cpf: Faker::Internet.user_name(11..11))
      expect(patient).to_not be_valid
    end

    it 'is not valid without a birth date' do
      patient = build(:patient, birth_date: '')
      expect(patient).to_not be_valid
    end

    it 'is not valid without a name' do
      patient = build(:patient, name: '')
      expect(patient).to_not be_valid
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
