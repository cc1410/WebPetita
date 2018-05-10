/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbcPepitaWeb;

import excepciones.Excepciones;
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

    private void conectar() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/webpepita";
        String user = "root";
        String pass = "";
        conexion = DriverManager.getConnection(url, user, pass);
    }

    //*********************Desconectar de la BBDD ***************
    private void desconectar() throws SQLException {
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
     * @throws Excepciones
     */
    public void insertarUsuario(Usuario c) throws SQLException, Excepciones {
        if (existeUsuario(c)) {
            throw new Excepciones("Ya existe el Usuario");
        }
        String insert = "insert into usuario values (?, ?, ?, ?, ?);";
        PreparedStatement usuario = conexion.prepareStatement(insert);
        usuario.setString(3, c.getName());
        usuario.setString(2, c.getLastname());
        usuario.setString(1, c.getMail());
        usuario.setString(4, c.getPassword());
        usuario.setInt(5, c.getType());

        usuario.executeUpdate();
        usuario.close();
    }

    //******Existe Usuario ?? ***********
    private boolean existeUsuario(Usuario c) throws SQLException {
        String select = "select * from usuario where mail='" + c.getMail()+ "'";
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

    public Usuario loginUser(String mail, String password) throws Excepciones, SQLException {
        
        conectar();
        Usuario a = new Usuario(mail, password);
        if (!existeUsuario(a)) {
            throw new Excepciones("No existe el usuario");
        }
        String select = "select * from usuario where mail='" + mail + "' and password='"+password+"'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            a.setName(rs.getString("name"));
            a.setLastname(rs.getString("lastname"));
            a.setMail(rs.getString("mail"));
            a.setPassword(rs.getString("password"));
            a.setType(rs.getInt("type"));
        } else {
            throw new Excepciones("Password incorrecto");
        }
        rs.close();
        st.close();
        desconectar();
        return a;
    }
}
