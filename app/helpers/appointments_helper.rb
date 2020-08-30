# frozen_string_literal: true

# Helper from partial
module AppointmentsHelper
  def search_appointment(_hora, _min)
    link_to '#', data: {toggle: "modal", target: "#modal_appointment_new", hora: _hora, min: _min}, class: 'btn btn-outline-primary btn-block' do
      'Agendar consulta'
    end
  end
end
