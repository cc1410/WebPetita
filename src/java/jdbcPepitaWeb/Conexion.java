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
import javax.ejb.Stateless;
import objetos.Usuario;

/**
 *
 * @author Juan Elberto
 */
@Stateless
public class Conexion {

    //*********************Conexion a la BBDD ******************
    Connection conexion;

    private void conectar() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/webpepitta";
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
     * @throws Exepciones
     */
    public void insertarUsuario(Usuario c) throws SQLException, Exepciones {
        if (existeUsuario(c)) {
            throw new Exepciones("Ya existe el Usuario");
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

    public Usuario loginUser(String mail, String password) throws Exepciones, SQLException {
        
        conectar();
        Usuario a = new Usuario(mail, password);
        if (!existeUsuario(a)) {
            throw new Exepciones("No existe el usuario");
        }

        Usuario b = new Usuario();
        if (!b.getPassword().equals(password)) {
            throw new Exepciones("Password incorrecto");
        }
        String select = "select * from usuario where mail='" + mail + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);

        if (rs.next()) {
            b.setName(rs.getString("name"));
            b.setLastname(rs.getString("lastname"));
            b.setMail(rs.getString("mail"));
            b.setPassword(rs.getString("password"));
            b.setType(rs.getInt("type"));
        }
        rs.close();
        st.close();
        desconectar();
        return b;
    }
}
