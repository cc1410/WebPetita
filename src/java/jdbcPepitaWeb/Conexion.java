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
import model.Profesor;
import model.Usuario;

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
     * @param u
     * @throws SQLException
     * @throws Excepciones
     */
    public void insertarProfesor(Usuario u) throws SQLException, Excepciones {
        if (existeUsuario(u)) {
            throw new Excepciones("Ya existe el Usuario");
        }
        String insert = "insert into users values (?, ?, ?, ?, ?,?);";
        PreparedStatement usuario = conexion.prepareStatement(insert);
        usuario.setString(1, u.getNombre());
        usuario.setString(2, u.getApellido());
        usuario.setString(3, u.getDni());
        usuario.setString(4, u.getEmail());
        usuario.setString(5, u.getPassword());
        usuario.setInt(6, 1);

        usuario.executeUpdate();
        usuario.close();
    }

    //******Existe Usuario ?? ***********
    private boolean existeUsuario(Usuario p) throws SQLException {
        String select = "select * from users where mail='" + p.getEmail() + "'";
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
        Usuario aux = new Usuario();
        aux.setEmail(mail);
        aux.setPassword(password);
        if (!existeUsuario(aux)) {
            throw new Excepciones("No existe el usuario");
        }
        String select = "select * from users where mail='" + mail + "' and password='" + password + "'";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        if (rs.next()) {
            aux.setNombre(rs.getString("name"));
            aux.setApellido(rs.getString("lastname"));
            aux.setEmail(rs.getString("mail"));
            aux.setPassword(rs.getString("password"));
        } else {
            throw new Excepciones("Password incorrecto");
        }
        rs.close();
        st.close();
        desconectar();
        return aux;
    }
}
