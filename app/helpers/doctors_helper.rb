# frozen_string_literal: true

# Helper from partial
module DoctorsHelper
  def all_doctors
    Doctor.all.order(:name)
  end

  def doctor_new
    Doctor.new
  end

  def all_uf_brazilian
    %w[RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF]
  end
end
