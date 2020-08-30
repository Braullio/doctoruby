document.addEventListener('DOMContentLoaded', () => {
  $('#modal_appointment_new').on('show.bs.modal', function (e) {
    var hour = $(e.relatedTarget).data('hour');
    var min = $(e.relatedTarget).data('min');
    document.getElementById('hour').value = String(hour).concat(':', String(min));
  })
})

document.addEventListener('DOMContentLoaded', () => {
  $('#modal_appointment_edit').on('show.bs.modal', function (e) {
    var doctorId = $(e.relatedTarget).data('id');
    $(e.currentTarget).find('input[name="appointment[id]"]').val(doctorId);

    var hour = $(e.relatedTarget).data('hour');
    var min = $(e.relatedTarget).data('min');
    document.getElementById('hour_edit').value = String(hour).concat(':', String(min));

    var patientId = $(e.relatedTarget).data('patient');
    document.getElementById('Patient').value = patientId;
  })
})
