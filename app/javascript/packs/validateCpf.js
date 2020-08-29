document.addEventListener('DOMContentLoaded', () => {
  var cpf = document.getElementById('patient_cpf');

  cpf.addEventListener('focusout', function () {
    cpf_value = document.getElementById('patient_cpf').value;
    if (validate_cpf(cpf_value) == false && cpf_value.length > 0) {
      alert('Por favor verificar o cpf, o mesmo se encontra invalido.');
    }
  }, false);
})

function validate_cpf(cpf) {
  var Sum;
  var Rest;

  cpf = cpf.replace(/[^\d]+/g, '');
  Sum = 0;

  if (cpf.length != 11 || cpf == '' || cpf == "00000000000" ||
    cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" ||
    cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" ||
    cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999") return false;

  for (i = 1; i <= 9; i++) Sum = Sum + parseInt(cpf.substring(i - 1, i)) * (11 - i);

  Rest = (Sum * 10) % 11;
  if ((Rest == 10) || (Rest == 11)) Rest = 0;
  if (Rest != parseInt(cpf.substring(9, 10))) return false;

  Sum = 0;
  for (i = 1; i <= 10; i++) Sum = Sum + parseInt(cpf.substring(i - 1, i)) * (12 - i);

  Rest = (Sum * 10) % 11;
  if ((Rest == 10) || (Rest == 11)) Rest = 0;
  if (Rest != parseInt(cpf.substring(10, 11))) return false;

  return true;
}