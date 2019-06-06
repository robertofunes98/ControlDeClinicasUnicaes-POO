<%@page import="org.json.JSONArray"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases_conexion.ConexionDB"%>
<%@page import="core.Variables"%>
<!DOCTYPE html>
<html>
	
    <%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("jvpm") == null)
        response.sendRedirect("login.jsp");
    %>
	
    <head>
        <title>Medicinas</title>
        <meta charset='utf-8'>
        <link rel='stylesheet' type='text/css' href='style/estilo.css'>
        <script src="js/medicinas.js"></script>
        <style type="text/css">
        form button{
        margin-bottom: 10px;
        }
        h1,h2,h3,h4,h5,h6{
        text-align: center;
        }
        </style>
    </head>
    <body>

        <h1>Clinica <%out.print(Variables.nombreClinica);%></h1>
        <h3 id='accion'>Registrar medicina</h3>
        <form method='post'>
            <%

            if(request.getParameter("registrar") != null)
            {
                String nombre=request.getParameter("nombre");
                String activo=request.getParameter("activo");
                String cantidad=request.getParameter("cantidad");
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
                int cantidadFilas=conexion.ejecutarComando("INSERT into Medicina values(null, '"+nombre+"', '"+activo+"', '"+cantidad+"', '"
                +sesion.getAttribute("jvpm")+"')");
                if(cantidadFilas>0)
                    out.print("<p class='help is-success'>Se registro la medicina</p><br>");
                else
                    out.print("<p class='help is-danger'>La medicina no pudo ser registrada</p><br>");
            }
            else if(request.getParameter("modificar") != null)
            {
                String idMedicamento=request.getParameter("idMedicamento");
                String nombre=request.getParameter("nombre");
                String activo=request.getParameter("activo");
                String cantidad=request.getParameter("cantidad");
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
                int cantidadFilas=conexion.ejecutarComando("UPDATE Medicina set nombre='"+nombre+"', activo='"+activo+"'"
                        + ", cantidad='"+cantidad+"' WHERE idMedicamento="+idMedicamento);
                if(cantidadFilas>0)
                    out.print("<p class='help is-success'>Se actualizo la medicina</p><br>");
                else
                    out.print("<p class='help is-danger'>La medicina no pudo ser actualizada</p><br>");

            }
            else if(request.getParameter("eliminar") != null)
            {
                String idMedicamento=request.getParameter("idMedicamento");
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
              
     
                int cantidadFilas=conexion.ejecutarComando("DELETE from Medicina WHERE idMedicamento='"+idMedicamento+"'");
                
                
                if(cantidadFilas>0)
                    out.print("<p class='help is-success'>Se elimino la medicina</p><br>");
                else
                    out.print("<p class='help is-danger'>La medicina no pudo ser eliminada</p><br>");
            }
            %>

            <label>Nombre: </label>
            <input type='text' name='nombre' id='nombre' maxlength="50">
            <label>Activo/s: </label>
            <input type='text' name='activo' id='activo' maxlength="100">
            <label>Cantidad del/los activo: </label>
            <input type='text' name='cantidad' id='cantidad' maxlength="100">
            <input type='hidden' name='idMedicamento' id='idMedicamento' maxlength="100">
            <button type='submit' name='registrar' id='btnAceptar'>Registrar</button>
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
                <th></th>
            </tr>

            <%
            ConexionDB conexion=new ConexionDB("jdbc:mysql://localhost:3306/sistema_clinica","root","mysql");

            ResultSet rsResultado=conexion.ejecutar("SELECT * FROM Medicina");

            LinkedList<LinkedList> arrayListResultado=new LinkedList<LinkedList>();

            arrayListResultado=conexion.convertirRsToArrayList(rsResultado);


            for(int i=0; i<arrayListResultado.size();i++)
            {
                JSONArray jsArray = new JSONArray(arrayListResultado.get(i));
                out.print("<tr>");
                out.print("<td>"+arrayListResultado.get(i).get(0)+"</td>");
                out.print("<td>"+arrayListResultado.get(i).get(1)+"</td>");
                out.print("<td>"+arrayListResultado.get(i).get(2)+"</td>");
                out.print("<td>"+arrayListResultado.get(i).get(3)+"</td>");
                out.print("<td><input type='hidden' id='posicion"+i+"' value='"
                        +jsArray+"'><button id='btnModificar"+i+"' class='primaryButton' onclick='modificar("+i+")' type='button'>Modificar</button></td>");
                out.print("<td><input type='hidden' id='posicionEliminar"+i+"' value='"+jsArray+"'><button id='btnEliminar"+i
                        +"' class='cancelButton' onclick='eliminar("+i+")' type='button'>Borrar</button></td>");
                out.print("</tr>");
            }


            %>
        </table>
    </body>
</html>