//Funciones para medicinas.jsp
function modificar(posicion)
{
	var datos=document.getElementById('posicion'+posicion).value;
	var btnAceptar=document.getElementById('btnAceptar');
	var btnModificar=document.getElementById('btnModificar'+posicion);
	var informacionAccion=document.getElementById('accion');
	informacionAccion.innerHTML="Modificar";

	datos = JSON.parse(datos);

	var inNombre=document.getElementById('nombre').value=datos[1];
	var inActivo=document.getElementById('activo').value=datos[2];
	var inCantidad=document.getElementById('cantidad').value=datos[3];
	var inIdMedicamento=document.getElementById('idMedicamento').value=datos[0];

	btnAceptar.name="modificar";
	btnAceptar.innerHTML="Modificar";
	btnModificar.innerHTML="Cancelar";
	btnModificar.classList.add("cancelButton");
	btnModificar.classList.remove("primaryButton");
	btnModificar.setAttribute("onclick","registrar("+posicion+")");
}

function registrar(posicion)
{
	var btnAceptar=document.getElementById('btnAceptar');
	var btnModificar=document.getElementById('btnModificar'+posicion);
	var informacionAccion=document.getElementById('accion');
	informacionAccion.innerHTML="Registrar";
	btnAceptar.name="registrar";
	btnAceptar.innerHTML="Registrar";
	btnModificar.innerHTML="Modificar";
	btnModificar.classList.add("primaryButton");
	btnModificar.classList.remove("cancelButton");
	var inNombre=document.getElementById('nombre').value="";
	var inActivo=document.getElementById('activo').value="";
	var inCantidad=document.getElementById('cantidad').value="";
	btnModificar.setAttribute("onclick","modificar("+posicion+")");
}

