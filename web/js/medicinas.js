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


function eliminar(posicion)
{
	confirm("¿Esta seguro que desea borrar este registro?");

	var datos=document.getElementById('posicion'+posicion).value;
	datos = JSON.parse(datos);

	form = document.createElement("form");// creamos el formulario
	form.setAttribute("method", "post");
	
	control = document.createElement("input");// creamos un control
	control.setAttribute("type", "text");
	control.setAttribute("name", "idMedicamento");
	control.setAttribute("value", datos[0]);
	form.appendChild(control); // lo añadimos al form

	control2 = document.createElement("input");// creamos un control
	control2.setAttribute("type", "text");
	control2.setAttribute("name", "eliminar");
	form.appendChild(control2); // lo añadimos al form
	
	document.body.appendChild(form);

	form.submit();
}