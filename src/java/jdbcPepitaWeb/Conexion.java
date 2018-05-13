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
import java.util.ArrayList;
import java.util.List;
import model.Asignatura;
import model.Clase;
import model.Curso;
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
    public void insertarUsuario(Usuario u) throws SQLException, Excepciones {
        conectar();
        if (existeUsuario(u)) {
            throw new Excepciones("Ya existe el Usuario");
        }
        String insert = "insert into users values (?, ?, ?, ?, ?,?);";
        PreparedStatement usuario = conexion.prepareStatement(insert);
        usuario.setString(1, u.getNombre());
        usuario.setString(2, u.getApellido());
        usuario.setString(3, u.getPassword());
        usuario.setString(4, u.getDni());
        usuario.setString(5, u.getEmail());
        usuario.setInt(6, u.getTipo());
        usuario.executeUpdate();
        usuario.close();
        if (u.getTipo() == 2) {
            insertATablaAlumno(u);
        }
        desconectar();
    }

    public void insertATablaAlumno(Usuario u) throws SQLException {
        String insert = "insert into alumno values (?, ?);";
        PreparedStatement usuario = conexion.prepareStatement(insert);
        usuario.setString(1, u.getEmail());
        usuario.setString(2, null);
        usuario.executeUpdate();
        usuario.close();
        desconectar();
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

    //comprobar login
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
            aux.setDni(rs.getString("dni"));
            aux.setPassword(rs.getString("password"));
        } else {
            throw new Excepciones("Password incorrecto");
        }
        rs.close();
        st.close();
        desconectar();
        return aux;
    }

    //insertar curso
    public void insertarCurso(Curso a) throws SQLException, Excepciones {
        conectar();
        if (existeCurso(a)) {
            throw new Excepciones("Ya existe el curso");
        }

        String insert = "insert into curso values (?, ?);";
        PreparedStatement curso = conexion.prepareStatement(insert);
        curso.setString(1, a.getNombre());
        curso.setInt(2, a.getAnyo());

        curso.executeUpdate();
        curso.close();
        desconectar();
    }

    // existe Curso
    private boolean existeCurso(Curso p) throws SQLException {
        String select = "select * from curso where nombre='" + p.getNombre() + "'";
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

    //insertar clase
    public void insertarClase(Clase a) throws SQLException, Excepciones {
        conectar();
        if (existeClase(a)) {
            throw new Excepciones("Ya existe la clase");
        }

        String insert = "insert into clase values (?, ?, ?);";

        PreparedStatement clase = conexion.prepareStatement(insert);
        clase.setString(1, a.getNombre());
        clase.setString(2, null);
        clase.setString(3, null);

        clase.executeUpdate();
        clase.close();
        desconectar();
    }

    // existe Clase
    private boolean existeClase(Clase p) throws SQLException {
        String select = "select * from clase where nombre='" + p.getNombre() + "'";
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

    //insertar asignatura
    public void insertarAsignatura(Asignatura a) throws SQLException, Excepciones {
        conectar();
        if (existeAsignatura(a)) {
            throw new Excepciones("Ya existe la Asignatura");
        }

        String insert = "insert into asignatura values (?, ?);";

        PreparedStatement clase = conexion.prepareStatement(insert);
        clase.setString(1, a.getNombre());
        clase.setString(2, null);

        clase.executeUpdate();
        clase.close();
        desconectar();
    }

    // existe asignatura
    private boolean existeAsignatura(Asignatura p) throws SQLException {
        String select = "select * from asignatura where nombre='" + p.getNombre() + "'";
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

    //modificar perfil
    public void modificarPerfil(Usuario a) throws SQLException, Excepciones {
        conectar();
        if (!existeUsuario(a)) {
            throw new Excepciones("No existe la Usuario");
        }

        String insert = "update users set name=?, lastname=?, dni=? where mail=?;";
        PreparedStatement aux = conexion.prepareStatement(insert);
        aux.setString(1, a.getNombre());
        aux.setString(2, a.getApellido());
        aux.setString(3, a.getDni());
        aux.setString(4, a.getEmail());

        aux.executeUpdate();
        aux.close();
        desconectar();
    }

    //modificar Password
    public void modificarPassword(Usuario a) throws SQLException, Excepciones {
        conectar();
        if (!existeUsuario(a)) {
            throw new Excepciones("No existe la Usuario");
        }

        String insert = "update users set password=? where mail=?;";
        PreparedStatement aux = conexion.prepareStatement(insert);
        aux.setString(1, a.getPassword());
        aux.setString(2, a.getEmail());

        aux.executeUpdate();
        aux.close();
        desconectar();
    }

    //lista de cursos
    public List<Curso> listaCurso() throws SQLException {
        conectar();
        String select = "select * from curso";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        List<Curso> listAux = new ArrayList<>();

        while (rs.next()) {
            Curso c = new Curso();
            c.setNombre(rs.getString("nombre"));
            c.setAnyo(rs.getInt("ano"));
            listAux.add(c);
        }
        rs.close();
        st.close();
        desconectar();
        return listAux;
    }

    //lista de Clases
    public List<Clase> listaClase() throws SQLException {
        conectar();
        String select = "select * from clase ";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        List<Clase> listAux = new ArrayList<>();

        while (rs.next()) {
            Clase c = new Clase();
            c.setNombre(rs.getString("nombre"));
            listAux.add(c);
        }
        rs.close();
        st.close();
        desconectar();
        return listAux;
    }

    //lista de alumnos
    public List<Usuario> listaAlumnos() throws SQLException {
        conectar();
        String select = "select * from users where type=2 ";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        List<Usuario> listAux = new ArrayList<>();

        while (rs.next()) {
            Usuario u = new Usuario();
            u.setNombre(rs.getString("name"));
            u.setEmail(rs.getString("mail"));
            u.setApellido(rs.getString("lastname"));
            listAux.add(u);
        }
        rs.close();
        st.close();
        desconectar();
        return listAux;
    }

    public List<Asignatura> listaAsignatura() throws SQLException {
        conectar();
        String select = "select * from asignatura";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        List<Asignatura> listAux = new ArrayList<>();

        while (rs.next()) {
            Asignatura a = new Asignatura();
            a.setNombre(rs.getString("nombre"));
            listAux.add(a);
        }
        rs.close();
        st.close();
        desconectar();
        return listAux;
    }

    public List<Usuario> listaProfesorNotTutor() throws SQLException {
        conectar();
        String select = "select * from users where type = 1 and not exists(select tutor from clase where clase.tutor = users.mail)";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        List<Usuario> listAux = new ArrayList<>();

        while (rs.next()) {
            Usuario u = new Usuario();
            u.setNombre(rs.getString("name"));
            u.setEmail(rs.getString("mail"));
            u.setApellido(rs.getString("lastname"));
            listAux.add(u);
        }
        rs.close();
        st.close();
        desconectar();
        return listAux;
    }

    
    public List<Usuario> listaProfesor() throws SQLException {
        conectar();
        String select = "select * from users where type = 1";
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(select);
        List<Usuario> listAux = new ArrayList<>();

        while (rs.next()) {
            Usuario u = new Usuario();
            u.setNombre(rs.getString("name"));
            u.setEmail(rs.getString("mail"));
            u.setApellido(rs.getString("lastname"));
            listAux.add(u);
        }
        rs.close();
        st.close();
        desconectar();
        return listAux;
    }
    
    public void asignarCursoClase(String nombreCurso, String nombreClase) throws SQLException {
        conectar();
        String insert = "update clase set curso=? where nombre=?;";
        PreparedStatement aux = conexion.prepareStatement(insert);
        aux.setString(1, nombreCurso);
        aux.setString(2, nombreClase);
        aux.executeUpdate();
        aux.close();
        desconectar();
    }

    public void asignarClaseTutor(String nombreTutor, String nombreClase) throws SQLException {
        conectar();
        String insert = "update clase set tutor=? where nombre=?;";
        PreparedStatement aux = conexion.prepareStatement(insert);
        aux.setString(1, nombreTutor);
        aux.setString(2, nombreClase);
        aux.executeUpdate();
        aux.close();
        desconectar();
    }

    public void asignarCursoAsignatura(String nombreAsignatura, String nombreCurso) throws SQLException {
        conectar();
        String insert = "update asignatura set curso=? where nombre=?;";
        PreparedStatement aux = conexion.prepareStatement(insert);
        aux.setString(1, nombreCurso);
        aux.setString(2, nombreAsignatura);
        aux.executeUpdate();
        aux.close();
        desconectar();
    }

    public void asignarClaseAlumno(String nombreAlumno, String nombreClase) throws SQLException {
        conectar();
        String insert = "update alumno set clase=? where email=?;";
        PreparedStatement aux = conexion.prepareStatement(insert);
        aux.setString(1, nombreClase);
        aux.setString(2, nombreAlumno);
        aux.executeUpdate();
        aux.close();
        desconectar();
    }
    
    public void asignarProfesorAsignatura(String profesor,String asignatura) throws SQLException{
        conectar();
        String insert = "update asignatura set profesor=? where nombre=?;";
        PreparedStatement aux = conexion.prepareStatement(insert);
        aux.setString(1, profesor);
        aux.setString(2, asignatura);
        aux.executeUpdate();
        aux.close();
        desconectar();
    }

}
