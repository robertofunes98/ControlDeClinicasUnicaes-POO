<%@page import="java.sql.ResultSet"%>
<%@page import="clases_conexion.ConexionDB"%>
<!DOCTYPE html>
<html>
    <%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("jvpm") != null)
    {
        response.sendRedirect("index.jsp");
    }
    %>
    <head>
        <title>Login</title>
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
    
    <body>
        
        <h1>Clinica</h1>
        <!--Formulario para registrar medico-->
        <h3>Login</h3>
        <form method='post'>
            <%
            try{
                if(request.getParameter("login") != null)
                {
                    String jvpm=request.getParameter("jvpm");
                    String clave=request.getParameter("clave");

                    ConexionDB conexion=new ConexionDB("jdbc:mysql://localhost:3306/sistema_clinica","root","mysql");


                    ResultSet rsResultado=conexion.ejecutar("SELECT * FROM Medico WHERE jvpm='"+jvpm+"' and clave='"+clave+"'");

                    if(rsResultado.next())
                    {
                        sesion.setAttribute("jvpm", jvpm);
                        response.sendRedirect("index.jsp");
                    }
                    else
                    {
                        out.print("<p class='help is-danger'>Hay un error con los datos de inicio de sesion</p><br>");
                    }
                }
            }
            catch(Exception e)
            {
                out.print(e.getMessage());
            }
            %>
            <label>JVPM: </label>
            <input type='text' name='jvpm' maxlength="6">
            <label>Clave: </label>
            <input type='password' name='clave' maxlength="15">
            <button type='submit' name='login'>Login</button>
        </form>
    </body>
</html>