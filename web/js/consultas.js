var conteoGlobal=0;

function agregarFila(){
	conteoGlobal++;
	var selectMedicina=document.getElementById("datosPaciente");
	var datos = JSON.parse(selectMedicina.value);

	var row = document.getElementById("tblMedicina").insertRow(-1);
	row.innerHTML = '\
	<td><input type="hidden" name="idMedicamento[]" value="'+datos[0]+'"></td>\
	<td>'+datos[1]+'</td>\
	<td>'+datos[2]+'</td>\
	<td>'+datos[3]+'</td>\
	<td><input type="text" class="inputTabla" name="dosis[]" id="dosis"></td>\
	<td>\
		<button id="btnEliminar" class="cancelButton" onclick="eliminarFila('+conteoGlobal+')" type="button">Borrar</button>\
	</td>\
	';

	row.setAttribute("id","posicionRow"+conteoGlobal);

	selectMedicina.selectedIndex=0;
}

function eliminarFila(posicion){
  var row = document.getElementById("posicionRow"+posicion);
  if(posicion <= 0)
    alert('No se puede eliminar el encabezado');
  else
    row.parentNode.removeChild(row);
}