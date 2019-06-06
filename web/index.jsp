<!DOCTYPE html>
    <html>
    <head>
        <title>Index</title>
        <meta charset='UTF-8'>
        <link rel='stylesheet' type='text/css' href='style/estilo.css'>
        <link rel='stylesheet' type='text/css' href='style/bulma.min.css'>
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
        <nav class="navbar is-dark is-fixed">
            <div class="container">
              <div class="navbar-brand">
                <img class="navbar-brand-logo" src="images/logo.jpg" alt="ITCA-FEPADE">
                <span class="navbar-burger burger" data-target="navMenu">
                  <span></span>
                  <span></span>
                  <span></span>
                </span>
              </div>
              <div id="navMenu" class="navbar-menu">
                <div class="navbar-start">
                  <a href="index.html" class="navbar-item is-active">Inicio</a>
                  <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link">
                      Consultas
                    </a>
                    <div class="navbar-dropdown">
                      <a href="consultas.jsp" class="navbar-item">
                        Registrar consultas
                      </a>
                      <a href="revisar_consultas.jsp" class="navbar-item">
                        Revisar consultas
                      </a>
                    </div>
                  </div>
                  <a href="pacientes.jsp" class="navbar-item">Pacientes</a>
                  <%
                    HttpSession sesion = request.getSession();
                    if(sesion.getAttribute("jvpm") == null)
                        response.sendRedirect("login.jsp");
                    if(sesion.getAttribute("tipoUsuario").equals("admin"))
                        out.print("<a href=\"medicos.jsp\" class=\"navbar-item\">Medicos</a>");
                    %>
                  <a href="medicinas.jsp" class="navbar-item">Medicinas</a>
                  <a href="logout.jsp" class="navbar-item">Logout</a>
                </div>
              </div>
            </div>
          </nav>

          <h1>Clinica</h1>

          <!--Formulario para registrar medico-->
  
    </body>
</html>