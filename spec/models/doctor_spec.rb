# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'Model' do
    it 'is valid with valid attributes' do
      expect(create_doctor).to be_valid
    end

    it 'is not valid because CRM cannot repeat in the same UF' do
      doctor_new = create_doctor.dup
      expect(doctor_new).to_not be_valid
    end

    it 'is not valid without a CRM' do
      doctor = build(:doctor, crm: '')
      expect(doctor).to_not be_valid
    end

    it 'not valid with a non-numeric CRM' do
      doctor = build(:doctor, crm: Faker::Internet.user_name(7..7))
      expect(doctor).to_not be_valid
    end

    it 'is not valid without a CRM UF' do
      doctor = build(:doctor, crm_uf: '')
      expect(doctor).to_not be_valid
    end

    it 'is not valid without a name' do
      doctor = build(:doctor, name: '')
      expect(doctor).to_not be_valid
    end
  end

  def create_doctor
    create(:doctor)
  end
end
