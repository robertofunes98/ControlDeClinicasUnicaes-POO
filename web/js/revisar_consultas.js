function validar()
{
	var selectPaciente = document.getElementById("datosPaciente").selectedIndex;
	var errorAlert = document.getElementById("errorAlert");

	if(selectPaciente==0)
	{
		errorAlert.classList.add("help");
		errorAlert.classList.add("is-danger");
		errorAlert.classList.remove("invisible");
		errorAlert.innerHTML="Seleccione un paciente";
		return false;
	}
		
	return true;
}