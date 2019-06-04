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
    
    public ResultSet ejecutar(String consulta) throws SQLException
    {
        //Objeto tipo statement que maneja la consulta.
        Statement cons = this.conexion.createStatement();
        //Ejecutando la consulta.
        return cons.executeQuery(consulta);
    }
    
    public void ejecutarComando(String comando) throws SQLException {
        //Objeto tipo Statement que maneja el comando.
        Statement com = this.conexion.createStatement();
        //Ejecuta el comando.
        try {
            com.executeUpdate(comando);
            System.out.println("Comando ejecutado.");
        }
        catch(SQLException e) {
            System.out.println(e);
        }
    }
    
    public void cerrarConexion() throws SQLException {
        this.conexion.close();
    }
    
    
}