<!DOCTYPE html>
    <html>
    <head>
        <title>Medicos</title>
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

        <h3>Registrar medicos</h3>
        <form method='post'>
            <label>Nombres: </label>
            <input type='text' name='nombreMedico' maxlength="50">

            <label>Apellidos: </label>
            <input type='text' name='apellidoMedico' maxlength="50">

            <label>JVPM: </label>
            <input type='text' name='jvpm' maxlength="10">

            <label>Teléfono: </label>
            <input type='text' name='telefono' maxlength="10">

            <label>Especialidad: </label>
            <select>
                <!--Esto se cargara desde jsp-->
                <option>Odontología</option>
                <option>Opcion 2</option>
                <option>Opcion 3</option>
                <option>Opcion 4</option>
                <option>Opcion 5</option>
            </select>

            <button type='submit' name='registrar'>Registrar</button>
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
                <th></th>
            </tr>

            <tr>
                <td>1</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>63024589</td>
                <td>Odontología</td>
                <td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
            </tr>

            <tr>
                <td>1</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>63024589</td>
                <td>Odontología</td>
                <td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
            </tr>

            <tr>
                <td>1</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>63024589</td>
                <td>Odontología</td>
                <td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
            </tr>

            <tr>
                <td>1</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>63024589</td>
                <td>Odontología</td>
                <td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
            </tr>

            <tr>
                <td>1</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>63024589</td>
                <td>Odontología</td>
                <td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
            </tr>

            <tr>
                <td>1</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>63024589</td>
                <td>Odontología</td>
                <td class="containsBoton"><a class="enlaceBtn" href="">Modificar</a></td>
            </tr>

            

        </table> 

    </body>
</html>