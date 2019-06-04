<%-- 
    Document   : index
    Created on : May 14, 2019, 6:56:18 PM
    Author     : CATOLICA
--%>

<%@page import="clases_conexion.Medico"%>
<%@page import="java.sql.*"%>
<%@page import="clases_conexion.ConexionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            ConexionDB conexion = new ConexionDB("jdbc:mysql://localhost:3306/sistema_clinica", "root", "");
            
            out.print(conexion.conectar());
            
            //DatabaseMetaData dbmd = conexion.getMetaData();
            
            /*ResultSet rs = dbmd.getCatalogs();
            while ( rs.next() )
            {
                out.println(rs.getObject(1));
            }
            
            // tablas
            ResultSet rs2 = dbmd.getColumns("sistema_clinica", null, "Doctor", null);
            while (rs2.next() )
            {
            // La columna 3 del resultset es el nombre de la tabla
            out.println(rs2.getObject(4));
            }*/
            
            try{
                ResultSet rs = new Medico().selectGeneral(conexion.conexion);
                ResultSetMetaData rsmd=rs.getMetaData();
                out.println(rsmd.getColumnCount());
                
                
                
                
                while(rs.next()){
                    for(int i = 1; i <= rsmd.getColumnCount(); i++){
                        out.print(rs.getString(i) + " ");
                    }
                    out.println("");
                }
            }
            catch(SQLException e)
            {
                out.print(e.toString());
            }
            
            

            
        %>
    </body>
</html>
