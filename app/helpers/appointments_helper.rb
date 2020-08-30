# frozen_string_literal: true

# Helper from partial
module AppointmentsHelper
  def search_appointment(_hour, _min)
    appointment = @appointments.map { |appoint| appoint if "#{appoint.starts_at.hour}:#{appoint.starts_at.min}".eql?("#{_hour.to_i}:#{_min.to_i}") }.reject(&:blank?)
    appointment.present? ? btn_busy(appointment.try(:first), _hour, _min) : btn_free(_hour, _min)
  end

  def btn_free(_hour, _min)
    link_to '#', data: {toggle: 'modal', target: '#modal_appointment_new', hour: _hour, min: _min}, class: 'btn btn-outline-primary btn-block' do
      'Agendar consulta'
    end
  end

  def btn_busy(appoitment, _hour, _min)
    link_to '#', data: { toggle: 'modal', target: '#modal_appointment_edit', hour: _hour, min: _min, patient: appoitment.patient.id, id: appoitment.id }, class: 'btn btn-success btn-block' do
      "Agendado para #{appoitment.patient.name}"
    end
  end

  def hours_for_select
    %w[9:00 9:30 10:00 10:30 11:00 11:30 13:00 13:30 14:00 14:30 15:00 15:30 16:00 16:30 17:00 17:30 18:00 18:30]
  end
end
