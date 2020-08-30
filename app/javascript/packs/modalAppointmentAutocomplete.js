document.addEventListener('DOMContentLoaded', () => {
  $('#modal_appointment_new').on('show.bs.modal', function (e) {
    var hour = $(e.relatedTarget).data('hora');
    var min = $(e.relatedTarget).data('min');
    $(e.currentTarget).find('input[name="hour"]').val(String(hour).concat(':', String(min)));
  })
})
