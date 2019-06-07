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
    %>
    <head>
        <title>Pacientes</title>
        <meta charset='utf-8'>
        <link rel='stylesheet' type='text/css' href='style/estilo.css'>
        <script src="js/pacientes.js"></script>
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
        
        <div class='containsBoton-left'>
            <a class='enlaceBtn' href='index.jsp'>Regresar</a>
        </div><br>
        <h1>Clinica <%out.print(Variables.nombreClinica);%></h1>
        <h3 id='accion'>Registrar Pacientes</h3>

        <!--Formulario para registrar pacientes-->


        <form method='post' onsubmit='return validar()'>
            <p id='errorAlert' class='invisible'></p><br>
            <%

            if(request.getParameter("registrar") != null)
            {
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String fecha=request.getParameter("fecha");
                String sexo=request.getParameter("sexo");
                
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
                
                
                int cantidadFilas=conexion.ejecutarComando("INSERT into Paciente values(null, '"+nombres+"', '"+apellidos+"', '"+fecha+"', '"
                +sexo+"', '"+sesion.getAttribute("jvpm")+"')");
                
                
                if(cantidadFilas>0)
                    out.print("<p class='help is-success'>Se registro el paciente</p><br>");
                else
                    out.print("<p class='help is-danger'>El paciente no pudo ser registrado</p><br>");
            }
            else if(request.getParameter("modificar") != null)
            {
                String idPaciente=request.getParameter("idPaciente");
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String fecha=request.getParameter("fecha");
                String sexo=request.getParameter("sexo");
                
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
              
                int cantidadFilas=conexion.ejecutarComando("UPDATE Paciente set nombres='"+nombres+"', apellidos='"+apellidos+"'"
                        + ", fecha='"+fecha+"', sexo='"+sexo+"' WHERE idPaciente='"+idPaciente+"'");
                
                
                
                if(cantidadFilas>0)
                    out.print("<p class='help is-success'>Se actualizo el paciente</p><br>");
                else
                    out.print("<p class='help is-danger'>El paciente no pudo ser actualizado</p><br>");

            } 
            else if(request.getParameter("eliminar") != null)
            {
                String idPaciente=request.getParameter("idPaciente");
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
              
                
                int cantidadFilas=conexion.ejecutarComando("DELETE from Paciente WHERE idPaciente='"+idPaciente+"'");
                
                
                if(cantidadFilas>0)
                    out.print("<p class='help is-success'>Se elimino al paciente</p><br>");
                else
                    out.print("<p class='help is-danger'>El paciente no pudo ser eliminado</p><br>");
            }
            %>
            
            <label>Nombre: </label>
            <input type='text' name='nombres' id='nombres' maxlength="50" required>

            <label>Apellido: </label>
            <input type='text' name='apellidos' id='apellidos' maxlength="50" required>

            <label>Fecha de nacimiento: </label>
            <input type='date' name='fecha' id='fecha' required>

            <label>Sexo: </label>

            <select name='sexo' id='sexo'>
                <option>--Seleccione uno--</option>
                <option value='M'>Masculino</option>
                <option value='F'>Femenino</option>
            </select>
            
            <button type='submit' name='registrar' id='btnAceptar'>Registrar</button>
        </form>

        <!--Tabla de registros-->

        <table>
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Fecha de nacimiento</th>
                <th>Sexo</th>
                <th></th>
                <th></th>
            </tr>
            
            <%
            ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);

            ResultSet rsResultado=conexion.ejecutar("SELECT * FROM Paciente where jvpm='"+sesion.getAttribute("jvpm")+"'");

            LinkedList<LinkedList> arrayListResultado=new LinkedList<LinkedList>();

            arrayListResultado=conexion.convertirRsToArrayList(rsResultado);


            for(int i=0; i<arrayListResultado.size();i++)
            {
                JSONArray jsArray = new JSONArray(arrayListResultado.get(i));
                out.print("<tr>");
                out.print("<td>"+arrayListResultado.get(i).get(1)+"</td>");
                out.print("<td>"+arrayListResultado.get(i).get(2)+"</td>");
                out.print("<td>"+arrayListResultado.get(i).get(3)+"</td>");
                out.print("<td>"+arrayListResultado.get(i).get(4)+"</td>");
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