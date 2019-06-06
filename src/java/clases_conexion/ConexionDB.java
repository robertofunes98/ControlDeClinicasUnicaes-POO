package clases_conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;



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
    
    public int ejecutarComando(String comando) throws SQLException {
        //Objeto tipo Statement que maneja el comando.
        Statement com = this.conexion.createStatement();
        //Ejecuta el comando.
        int cantidadFilas=com.executeUpdate(comando);
        return cantidadFilas;
    }
    
    public void cerrarConexion() throws SQLException {
        this.conexion.close();
    }
    
    public LinkedList convertirRsToArrayList(ResultSet rsResultado) throws SQLException
    {
        LinkedList<LinkedList> arrayListResultado=new LinkedList<>();
        
        ResultSetMetaData rsmd = rsResultado.getMetaData(); 

        int numeroColumnas = rsmd.getColumnCount(); 
        
        while(rsResultado.next())
        {
            LinkedList<String> datos=new LinkedList<>();
            
            for(int i=0; i<numeroColumnas-1; i++)
            {
                datos.add(rsResultado.getString(i+1));
            }
            
            arrayListResultado.add(datos);
        }
        return arrayListResultado;
            
    }
}