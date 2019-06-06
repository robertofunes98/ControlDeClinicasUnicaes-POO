<%@page import="org.json.JSONArray"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases_conexion.ConexionDB"%>
<%@page import="core.Variables"%>
<!DOCTYPE html>
<html>
    <%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("jvpm") == null)
        response.sendRedirect("login.jsp");
    else if(sesion.getAttribute("tipoUsuario") != "admin")
        response.sendRedirect("index.jsp");
        
    %>
    <head>
        <title>Medicos</title>
        <meta charset='UTF-8'>
        <link rel='stylesheet' type='text/css' href='style/estilo.css'>
        <script src="js/medicos.js"></script>
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

        <!--Formulario para registrar medico-->

        <h3 id='accion'>Registrar medicos</h3>
        <form method='post'>
            
            <%

            if(request.getParameter("registrar") != null)
            {
                
                String jvpm=request.getParameter("jvpm");
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String telefono=request.getParameter("telefono");
                String especialidad=request.getParameter("especialidad");
                String clave=request.getParameter("clave");
                String tipoUsuario=request.getParameter("tipoUsuario");
                
                
               
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
                
                
                int cantidadFilas=conexion.ejecutarComando("INSERT into Medico values('"+jvpm+"', '"+nombres+"', '"+apellidos+"', '"
                +telefono+"', '"+especialidad+"', '"+clave+"', '"+tipoUsuario+"')");
                
                
                if(cantidadFilas>0)
                    out.print("<p class='help is-success'>Se registro el medico</p><br>");
                else
                    out.print("<p class='help is-danger'>El medico no pudo ser registrado</p><br>");
            }
            else if(request.getParameter("modificar") != null)
            {
                String jvpm=request.getParameter("jvpm");
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String clave=request.getParameter("clave");
                String telefono=request.getParameter("telefono");
                String especialidad=request.getParameter("especialidad");
                String tipoUsuario=request.getParameter("tipoUsuario");
                
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
              
                int cantidadFilas=conexion.ejecutarComando("UPDATE Medico set nombres='"+nombres+"', apellidos='"+apellidos+"'"
                        + ", telefono='"+telefono+"', clave='"+clave+"', especialidad='"+especialidad+"', tipoUsuario='"+tipoUsuario
                        +"' WHERE jvpm='"+jvpm+"'");
                
                
                
                if(cantidadFilas>0)
                    out.print("<p class='help is-success'>Se actualizo el medico</p><br>");
                else
                    out.print("<p class='help is-danger'>El medico no pudo ser actualizado</p><br>");

            } 
            else if(request.getParameter("eliminar") != null)
            {
                String jvpm=request.getParameter("jvpm");
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
              
                
                int cantidadFilas=conexion.ejecutarComando("DELETE from Medico WHERE jvpm='"+jvpm+"'");
                
                
                if(cantidadFilas>0)
                    out.print("<p class='help is-success'>Se elimino al medico</p><br>");
                else
                    out.print("<p class='help is-danger'>El medico no pudo ser eliminado</p><br>");
            }
            %>
            
            <label>Nombres: </label>
            <input type='text' name='nombres' id='nombres' maxlength="50">

            <label>Apellidos: </label>
            <input type='text' name='apellidos' id='apellidos' maxlength="50">

            <label>JVPM: </label>
            <input type='text' name='jvpm' id='jvpm' maxlength="6" required>
            
            <label>Clave: </label>
            <input type='password' name='clave' id='clave' maxlength="15">

            <label>Teléfono: </label>
            <input type='text' name='telefono' id='telefono' maxlength="10">

            <label>Especialidad: </label>
            <input type='text' name='especialidad' id='especialidad' maxlength="50">
            
            <label>Tipo usuario: </label>
            <select name='tipoUsuario' id='tipoUsuario' required>
                <option>--Seleccione uno--</option>
                <option value='usuario'>Usuario</option>
                <option value='admin'>Admin</option>
            </select>

            <button type='submit' name='registrar' id='btnAceptar'>Registrar</button>
        </form>

        <!--Tabla de registros-->
        <h3>Ver medicos</h3>
        <table>
      
            <tr>
                <th>JVPM</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Telefono</th>
                <th>Especialidad</th>
                <th>Tipo de medico</th>
                <th></th>
                <th></th>
            </tr>
            
            <%
            ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);

            ResultSet rsResultado=conexion.ejecutar("SELECT * FROM Medico");

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
                out.print("<td>"+arrayListResultado.get(i).get(4)+"</td>");
                out.print("<td>"+arrayListResultado.get(i).get(6)+"</td>");
                out.print("<td><input type='hidden' id='posicion"+i+"' value='"+jsArray+"'><button id='btnModificar"+i
                        +"' class='primaryButton' onclick='modificar("+i+")' type='button'>Modificar</button></td>");
                out.print("<td><input type='hidden' id='posicionEliminar"+i+"' value='"+jsArray+"'><button id='btnEliminar"+i
                        +"' class='cancelButton' onclick='eliminar("+i+")' type='button'>Borrar</button></td>");
                out.print("</tr>");
            }


            %>

        </table> 

    </body>
</html>