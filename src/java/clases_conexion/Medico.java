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
public class Medico {


    
    public ResultSet selectGeneral(Connection conexion) throws SQLException
    {
        Statement st = conexion.createStatement();
        
        ResultSet rs = st.executeQuery("select * from Doctor");
        
        return rs;
    }
}
