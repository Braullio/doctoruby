document.addEventListener('DOMContentLoaded', () => {
  $('#modal_doctor_edit').on('show.bs.modal', function (e) {
    var doctorId = $(e.relatedTarget).data('doctor-id');
    $(e.currentTarget).find('input[name="doctor[id]"]').val(doctorId);

    var doctorName = $(e.relatedTarget).data('doctor-name');
    $(e.currentTarget).find('input[name="doctor[name]"]').val(doctorName);

    var doctorCrm = $(e.relatedTarget).data('doctor-crm');
    $(e.currentTarget).find('input[name="doctor[crm]"]').val(doctorCrm);

    var doctorCrmUf = $(e.relatedTarget).data('doctor-crm-uf');
    document.getElementById('CRM_UF').value = doctorCrmUf;
  })
})
