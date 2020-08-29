document.addEventListener('DOMContentLoaded', () => {
  $('#modal_patient_edit').on('show.bs.modal', function (e) {
    var patientId = $(e.relatedTarget).data('patient-id');
    $(e.currentTarget).find('input[name="patient[id]"]').val(patientId);

    var patientName = $(e.relatedTarget).data('patient-name');
    $(e.currentTarget).find('input[name="patient[name]"]').val(patientName);

    var patientCpf = $(e.relatedTarget).data('patient-cpf');
    $(e.currentTarget).find('input[name="patient[cpf]"]').val(patientCpf);

    var patientBirth = $(e.relatedTarget).data('patient-birth-date');
    document.getElementById('Data de Nascimento__1i').value = parseInt(patientBirth.split('-')[0]);
    document.getElementById('Data de Nascimento__2i').value = parseInt(patientBirth.split('-')[1]);
    document.getElementById('Data de Nascimento__3i').value = parseInt(patientBirth.split('-')[2]);
    
    var patientDoctor = $(e.relatedTarget).data('patient-doctor-id');
    document.getElementById('Doutor').value = patientDoctor
  })
})
