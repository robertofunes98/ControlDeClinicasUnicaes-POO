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
        <title>Consultas</title>
        <meta charset='utf-8'>
        <link rel='stylesheet' type='text/css' href='style/estilo.css'>
        <script src="js/consultas.js"></script>
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
        <h1>Registrar Consultas</h1>

        <form method='post' class='form-personalizable'>
            <%
            if(request.getParameter("registrar") != null)
            {
                
                String fecha=request.getParameter("fecha");
                String diagnostico=request.getParameter("diagnostico");
                String altura=request.getParameter("altura");
                String peso=request.getParameter("peso");
                String observaciones=request.getParameter("observaciones");
                String idPaciente=request.getParameter("idPaciente");
                
                
               
                ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);
                
    
                int cantidadFilas=conexion.ejecutarComando("INSERT into Consulta values(null, '"+fecha+"', '"+diagnostico+"', '"+altura+"', '"
                +peso+"', '"+observaciones+"', '"+idPaciente+"')");
                
                
                if(cantidadFilas>0)
                {
                    String[] idMedicamentos=request.getParameterValues("idMedicamento[]");
                    String[] dosis=request.getParameterValues("dosis[]");
                    
                    ResultSet rsIdConsulta=conexion.ejecutar("SELECT idConsulta from Consulta where fecha='"+fecha
                            +"' and idPaciente="+idPaciente);
                    
                    LinkedList<LinkedList> arrayListIdConsulta=new LinkedList<LinkedList>();

                    arrayListIdConsulta=conexion.convertirRsToArrayList(rsIdConsulta);
                    
                    boolean todoCorrecto=true;
                    
                    for(int i=0; i<idMedicamentos.length; i++)
                    {
                        int cantidadFilasMedicinas=conexion.ejecutarComando("INSERT into MedicinaXConsulta values(null, '"
                            +arrayListIdConsulta.get(0).get(0)+"', '"+idMedicamentos[i]+"', '"+dosis[i]+"')");
                        
                        if(cantidadFilasMedicinas==0)
                            todoCorrecto=false;
                    }
                    
                    
                    
                    if(todoCorrecto)
                        out.print("<p class='help is-success'>Se registro la consulta</p><br>");
                    else
                        out.print("<p class='help is-danger'>La consulta fue registrada pero fallo el registro de medicinas</p><br>");
                }
                else
                    out.print("<p class='help is-danger'>La consulta no pudo ser registrada</p><br>");
            }
            %>
            <label>Fecha: </label>
            <input type='date' name='fecha'>
		
            <label>Diagnostico: </label>

            <textarea name="diagnostico" cols="50" rows="5" maxlength="500"></textarea>

            <label>Altura: (M)</label>
            <input type='number' name='altura' min="0" step="0.01">

            <label>Peso: (KG)</label>
            <input type='number' name='peso' min="0" step="0.01">

            <label>Observaciones: </label>

            <textarea name="observaciones" cols="50" rows="5" maxlength="500"></textarea>
            
            
            <label>Seleccionar medicina: </label>
            <select name='datosPaciente' id='datosPaciente' onchange='agregarFila()'>
                <option>--Seleccione una--</option>
            <%
            ConexionDB conexion=new ConexionDB(Variables.rutaDB,Variables.userDB,Variables.claveDB);

            ResultSet rsResultadoMedicina=conexion.ejecutar("SELECT * FROM Medicina");

            LinkedList<LinkedList> arrayListResultadoMedicina=new LinkedList<LinkedList>();

            arrayListResultadoMedicina=conexion.convertirRsToArrayList(rsResultadoMedicina);


            for(int i=0; i<arrayListResultadoMedicina.size();i++)
            {
                JSONArray jsArray = new JSONArray(arrayListResultadoMedicina.get(i));
                out.print("<option value='"+jsArray+"'>"+arrayListResultadoMedicina.get(i).get(2)
                        +", "+arrayListResultadoMedicina.get(i).get(1)+"</option>");
            }


            %>

            </select>
            
            
            
            

            <label>Paciente: </label>
            <select name='idPaciente'>
            <%
           
            ResultSet rsResultado=conexion.ejecutar("SELECT * FROM Paciente WHERE jvpm='"+sesion.getAttribute("jvpm")+"'");

            LinkedList<LinkedList> arrayListResultado=new LinkedList<LinkedList>();

            arrayListResultado=conexion.convertirRsToArrayList(rsResultado);


            for(int i=0; i<arrayListResultado.size();i++)
            {
                out.print("<option value='"+arrayListResultado.get(i).get(0)+"'>"+arrayListResultado.get(i).get(2)+", "+arrayListResultado.get(i).get(1)+"</option>");
            }


            %>

            </select>

            
        
            
            <h3>Medicnas recetadas</h3>
            <table id='tblMedicina' class='table-personalizable'>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Activo</th>
                    <th>Cantidad de activo</th>
                    <th>Dosis</th>
                    <th></th>
                </tr>
            </table>
            <br><br><br>
            <button type='submit' name='registrar'>Registrar</button>
        </form>
        <br><br><br>
    </body>
</html>