/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbcPepitaWeb;

import exepciones.Exepciones;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import objetos.Usuario;

/**
 *
 * @author Juan Elberto
 */
public class Conexion {
    //*********************Conexion a la BBDD ******************
    Connection conexion;

    public void conectar() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/webpepita";
        String user = "root";
        String pass = "";
        conexion = DriverManager.getConnection(url, user, pass);
    }

    //*********************Desconectar de la BBDD ***************
    public void desconectar() throws SQLException {
        if (conexion != null) {
            conexion.close();
        }
    }
    
    //********************Registrar Usuario **********************
    /**
     * metodo para registrar un usuario
     *
     * @param c
     * @throws SQLException
     * @throws Exepciones
     */
    public void insertarUsuario(Usuario c) throws SQLException, Exepciones {
        if (existeUsuario(c)) {
            throw new Exepciones("Ya existe el Usuario");
        }
        String insert = "insert into usuario values (null, ?, ?, ?, ?, ?);";
        PreparedStatement usuario = conexion.prepareStatement(insert);
        usuario.setString(1, c.getName());
        usuario.setString(2, c.getLastname());
        usuario.setString(3, c.getMail());
        usuario.setString(4, c.getPassword());
        usuario.setInt(5, c.getType());
       

        usuario.executeUpdate();
        usuario.close();
    }
    
    //******Existe Usuario ?? ***********
    private boolean existeUsuario(Usuario c) throws SQLException {
        String select = "select * from user where username='" + c.getIdusuario() + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        boolean existe = false;
        if (rs.next()) {
            existe = true;
        }
        rs.close();
        st.close();
        return existe;
    }
}
