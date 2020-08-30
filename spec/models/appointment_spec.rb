# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'Model' do
    it 'is valid with valid attributes' do
      expect(create_appointment).to be_valid
    end

    it 'is not valid because cannot repeat starts_at' do
      appointment_new = create_appointment.dup
      expect(appointment_new).to_not be_valid
    end

    it 'is not valid without a starts_at' do
      appointment = build(:appointment, starts_at: '')
      expect(appointment).to_not be_valid
    end

    it 'is not valid without a ends_at' do
      appointment = build(:appointment, ends_at: '')
      expect(appointment).to_not be_valid
    end
  end

  it 'is not valid without a doctor_id' do
    appointment = build(:appointment, doctor_id: '')
    expect(appointment).to_not be_valid
  end

  it 'is not valid without a patient_id' do
    appointment = build(:appointment, patient_id: '')
    expect(appointment).to_not be_valid
  end

  def create_appointment
    create(:appointment)
  end
end
