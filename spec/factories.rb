# frozen_string_literal: true

require 'faker'
require 'cpf_faker'

FactoryBot.define do
  factory :doctor do
    name   { Faker::FunnyName.name }
    crm    { Faker::Number.number(7) }
    crm_uf { 'GO' }
  end

  factory :patient do
    name { Faker::FunnyName.name }
    birth_date { Faker::Date.birthday }
    cpf { Faker::CPF.number }
    doctor { create(:doctor) }
  end
end
