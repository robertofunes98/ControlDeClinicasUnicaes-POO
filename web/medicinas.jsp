<!DOCTYPE html>
<html>
    
    <%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("jvpm") == null)
    {
        response.sendRedirect("login.jsp");
    }
    %>
    
	<head>
		<title>Medicinas</title>
		<meta charset='utf-8'>
		<link rel='stylesheet' type='text/css' href='style/estilo.css'>
		<style type="text/css">
		form button{
		margin-bottom: 10px;
		}
		h1,h2,h3,h4,h5,h6{
		text-align: center;
		}
		</style>
	</head>
        
        <%
        
        if(request.getParameter("registrar") != null)
        {
            out.print("se presiono boton");
        }

        %>
        
	<body>
		
		<h1>Clinica $$$$$$$$$</h1>
		<h3>Registrar medicina</h3>
		<form method='post'>
			<label>Nombre: </label>
			<input type='text' name='nombre' maxlength="50">
			<label>Activo/s: </label>
			<input type='text' name='activo' maxlength="50">
			<label>Cantidad del/los activo: </label>
			<input type='text' name='cantidad' maxlength="50">
			<button type='submit' name='registrar'>Registrar</button>
		</form>
		<br>
		<h3>Ver medicina</h3>
		<!--Tabla de medicinas-->
		<table>
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Activo/s</th>
				<th>Cantidad de activo/s</th>
				<th></th>
			</tr>
			<tr>
				<td>1</td>
				<td>Nombre</td>
				<td>Activo</td>
				<td>Cantidad</td>
				<td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
			</tr>
			
			<tr>
				<td>1</td>
				<td>Nombre</td>
				<td>Activo</td>
				<td>Cantidad</td>
				<td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
			</tr>
			<tr>
				<td>1</td>
				<td>Nombre</td>
				<td>Activo</td>
				<td>Cantidad</td>
				<td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
			</tr>
			<tr>
				<td>1</td>
				<td>Nombre</td>
				<td>Activo</td>
				<td>Cantidad</td>
				<td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
			</tr>
			<tr>
				<td>1</td>
				<td>Nombre</td>
				<td>Activo</td>
				<td>Cantidad</td>
				<td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
			</tr>
		</table>
	</body>
</html>