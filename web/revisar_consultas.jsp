<%@page import="org.json.JSONArray"%>
<%@page import="java.util.LinkedList"%>
<%@page import="clases_conexion.ConexionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="core.Variables"%>
<!DOCTYPE html>
    <html>
    <%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("jvpm") == null)
        response.sendRedirect("login.jsp");
    %>
    <head>
        <title>Revisar consultas</title>
        <meta charset='utf-8'>
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
        <h3>Buscar Consultas por Paciente</h3>


        <form method='post'>
            <label>Seleccionar Paciente: </label>

            <select name='datosPaciente'>
                <option>--Seleccione uno--</option>
            <%
            ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
           
            ResultSet rsResultado=conexion.ejecutar("SELECT * FROM Paciente WHERE jvpm='"+sesion.getAttribute("jvpm")+"'");

            LinkedList<LinkedList> arrayListResultado=new LinkedList<LinkedList>();

            arrayListResultado=conexion.convertirRsToArrayList(rsResultado);


            for(int i=0; i<arrayListResultado.size();i++)
            {
                out.print("<option value='"+arrayListResultado.get(i).get(0)+"----"+arrayListResultado.get(i).get(1)+" "+arrayListResultado.get(i).get(2)+"'>"+arrayListResultado.get(i).get(2)+", "+arrayListResultado.get(i).get(1)+"</option>");
            }


            %>
                
            </select>

            <button type='submit' name='buscar'>Buscar Consultas</button>
        </form>

        <!--Tabla de registros-->
        
        <%
            String paciente;
                
            String[] datosPaciente=null;
                
            if(request.getParameter("datosPaciente") != null)
            {
                paciente=request.getParameter("datosPaciente");
                
                
                
                datosPaciente=paciente.split("----");
                
                System.out.println(datosPaciente[0]);
            }
        %>

        <h3><% if(request.getParameter("datosPaciente") != null)
                    out.print(datosPaciente[1]); %></h3>
        
        <table>
            <tr>
                <th>Fecha</th>
                <th>Diagnostico</th>
                <th>Altura</th>
                <th>Peso</th>
                <th>Observaciones</th>
                <th>Medicinas recetadas</th>
            </tr>
            
            <%
            if(request.getParameter("buscar") != null)
            {
                ResultSet rsResultadoConsultas=conexion.ejecutar("SELECT * FROM Consulta where idPaciente="+datosPaciente[0]);

                LinkedList<LinkedList> arrayListResultadoConsultas=new LinkedList<LinkedList>();

                arrayListResultadoConsultas=conexion.convertirRsToArrayList(rsResultadoConsultas);


                for(int i=0; i<arrayListResultadoConsultas.size();i++)
                {
                    String idConsulta=arrayListResultadoConsultas.get(i).get(0).toString();
                    
                    ResultSet rsResultadoMedicinasXConsultaIds=conexion.ejecutar("SELECT idMedicamento FROM MedicinaXConsulta where idConsulta="+idConsulta);

                    LinkedList<LinkedList> arrayListResultadoMedicinasXConsultaIds=new LinkedList<LinkedList>();

                    arrayListResultadoMedicinasXConsultaIds=conexion.convertirRsToArrayList(rsResultadoMedicinasXConsultaIds);
                    
                    String medicinasRecetadas="";
                    
                    for(LinkedList<String> aux:arrayListResultadoMedicinasXConsultaIds)
                    {
                         ResultSet rsResultadoMedicinasNombres=conexion.ejecutar("SELECT nombre FROM Medicina where idMedicamento="+aux.get(0));

                        LinkedList<LinkedList> arrayListResultadoMedicinasNombres=new LinkedList<LinkedList>();

                        arrayListResultadoMedicinasNombres=conexion.convertirRsToArrayList(rsResultadoMedicinasNombres);
                        
                        medicinasRecetadas+="- "+arrayListResultadoMedicinasNombres.get(0).get(0)+"<br>";
                    }
                    
                    
                    out.print("<tr>");
                    out.print("<td>"+arrayListResultadoConsultas.get(i).get(1)+"</td>");
                    out.print("<td>"+arrayListResultadoConsultas.get(i).get(2)+"</td>");
                    out.print("<td>"+arrayListResultadoConsultas.get(i).get(3)+"</td>");
                    out.print("<td>"+arrayListResultadoConsultas.get(i).get(4)+"</td>");
                    out.print("<td>"+arrayListResultadoConsultas.get(i).get(5)+"</td>");
                    
                    out.print("<td>"+medicinasRecetadas+"</td>");
             
                    out.print("</tr>");
                }
            }
            %>
        </table> 

    </body>
</html>