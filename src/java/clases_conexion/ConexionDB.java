/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases_conexion;

import java.sql.*;



/**
 *
 * @author CATOLICA
 */
public class ConexionDB{
    public Connection conexion=null;
    //Constructor
    
    String db, usuario, clave;
    
    public ConexionDB (String dbR, String usuarioR, String claveR) {
        db=dbR;
        usuario=usuarioR;
        clave=claveR;
    }
    
    
    public String conectar() throws ClassNotFoundException,InstantiationException, IllegalAccessException
    {
        try {
            //instanciando la conexion.
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conexion=DriverManager.getConnection(db,usuario,clave);
            //Solo para efectos de prueba...
            return "¡¡¡Conectado!!!";
        }
        catch(SQLException e)
        {
            return e.toString();
        }
    }
    
    public DatabaseMetaData getMetaData() throws SQLException
    {
        return conexion.getMetaData();
    }
}
