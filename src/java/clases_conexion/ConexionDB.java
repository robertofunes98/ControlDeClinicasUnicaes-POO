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
    
    public ConexionDB (String dbR, String usuarioR, String claveR) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        db=dbR;
        usuario=usuarioR;
        clave=claveR;
        
        //instanciando la conexion.
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion=DriverManager.getConnection(db,usuario,clave);
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
    
    public int contarFilas(ResultSet rsContar) throws SQLException
    {
        int contador=0;
        while(rsContar.next())
            contador++;
        
        return contador;
            
    }
}