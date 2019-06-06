//Funciones para medicos.jsp
function modificar(posicion)
{
	var datos=document.getElementById('posicion'+posicion).value;
	var btnAceptar=document.getElementById('btnAceptar');
	var btnModificar=document.getElementById('btnModificar'+posicion);
	var informacionAccion=document.getElementById('accion');
	informacionAccion.innerHTML="Modificar";

	datos = JSON.parse(datos);

	var inJVPM=document.getElementById('jvpm');
	inJVPM.value=datos[0];
	var inNombres=document.getElementById('nombres').value=datos[1];
	var inApellidos=document.getElementById('apellidos').value=datos[2];
	var inTelefono=document.getElementById('telefono').value=datos[3];
	var inEspecialidad=document.getElementById('especialidad').value=datos[4];
	var inClave=document.getElementById('clave').value=datos[5];
	var inTipoUsuario=document.getElementById('tipoUsuario').value=datos[6];

	inJVPM.setAttribute("readonly","true");

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


	var inJVPM=document.getElementById('jvpm');
	inJVPM.value="";
	var inNombres=document.getElementById('nombres').value="";
	var inApellidos=document.getElementById('apellidos').value="";
	var inTelefono=document.getElementById('telefono').value="";
	var inEspecialidad=document.getElementById('especialidad').value="";
	var inClave=document.getElementById('clave').value="";
	var inTipoUsuario=document.getElementById('tipoUsuario').value="";

	inJVPM.removeAttribute("readonly");

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
	control.setAttribute("name", "jvpm");
	control.setAttribute("value", datos[0]);
	form.appendChild(control); // lo añadimos al form

	control2 = document.createElement("input");// creamos un control
	control2.setAttribute("type", "text");
	control2.setAttribute("name", "eliminar");
	form.appendChild(control2); // lo añadimos al form
	
	document.body.appendChild(form);

	form.submit();
}

function agregarFila(){

	var datos=document.getElementById("datosPaciente").value;
	datos = JSON.parse(datos);

	document.getElementById("tblMedicina").insertRow(-1).innerHTML = '\
	<td>'+datos[0]+'</td>\
	<td>'+datos[1]+'</td>\
	<td>'+datos[2]+'</td>\
	<td>'+datos[3]+'</td>\
	<td><input type="text" name="dosis" id="dosis"></td>\
	<td></td>\
	';
}

function eliminarFila(){
  var table = document.getElementById("tablaprueba");
  var rowCount = table.rows.length;
  //console.log(rowCount);
  
  if(rowCount <= 1)
    alert('No se puede eliminar el encabezado');
  else
    table.deleteRow(rowCount -1);
}