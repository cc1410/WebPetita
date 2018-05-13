package model;

public class Asignatura {

    private String nombre;
    private Curso curso;

    public Asignatura(String nombre) {
        this.nombre = nombre;
    }

    public Asignatura() {
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

}
