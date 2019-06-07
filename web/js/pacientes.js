//Funciones para medicos.jsp
function modificar(posicion)
{
	var datos=document.getElementById('posicion'+posicion).value;
	var btnAceptar=document.getElementById('btnAceptar');
	var btnModificar=document.getElementById('btnModificar'+posicion);
	var informacionAccion=document.getElementById('accion');
	informacionAccion.innerHTML="Modificar";

	datos = JSON.parse(datos);

	var fecha=datos[3].split(' ');


	var inNombres=document.getElementById('nombres').value=datos[1];
	var inApellidos=document.getElementById('apellidos').value=datos[2];
	var inFecha=document.getElementById('fecha').value=fecha[0];
	var inSexo=document.getElementById('sexo').value=datos[4];

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


	
	var inNombres=document.getElementById('nombres').value="";
	var inApellidos=document.getElementById('apellidos').value="";
	var inFecha=document.getElementById('fecha').value="";
	var inSexo=document.getElementById('sexo').value="";

	btnModificar.setAttribute("onclick","modificar("+posicion+")");
}

function eliminar(posicion)
{
	confirm("¿Esta seguro que desea borrar este registro?");

	var datos=document.getElementById('posicion'+posicion).value;
	datos = JSON.parse(datos);

	form = document.createElement("form");// creamos el formulario
	form.setAttribute("method", "post");
	
	control = document.createElement("input");// creamos un control
	control.setAttribute("type", "text");
	control.setAttribute("name", "idPaciente");
	control.setAttribute("value", datos[0]);
	form.appendChild(control); // lo añadimos al form

	control2 = document.createElement("input");// creamos un control
	control2.setAttribute("type", "text");
	control2.setAttribute("name", "eliminar");
	form.appendChild(control2); // lo añadimos al form
	
	document.body.appendChild(form);

	form.submit();
}

function validar()
{
	var select = document.getElementById("sexo").selectedIndex;
	var errorAlert = document.getElementById("errorAlert");

	if(select==0)
	{
		errorAlert.classList.add("help");
		errorAlert.classList.add("is-danger");
		errorAlert.classList.remove("invisible");
		errorAlert.innerHTML="Seleccione un sexo";
		return false;
	}
		
	return true;
}