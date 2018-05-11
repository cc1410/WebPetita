package model;

public class Usuario {

    private String nombre;
    private String apellido;
    private String password;
    private String dni;
    private String email;
    private int tipo;

    public Usuario() {

    }

    public Usuario(String nombre, String apellido, String password, String dni, String email, int tipo) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.password = password;
        this.dni = dni;
        this.email = email;
        this.tipo = tipo;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
}
