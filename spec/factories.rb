# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :doctor do
    name   { Faker::FunnyName.name }
    crm    { Faker::Number.number(7) }
    crm_uf { 'GO' }
  end
end
