package model;

import java.util.Date;

public class Nota {

    private Asignatura asignatura;
    private String comentario;
    private int nota;
    private String estado;
    private String nombreNota;
    private String alumno;

    public Nota(Asignatura asignaturaMarticula, String comentario, int nota, String estado, String nombreNota,String alumno) {
        this.asignatura = asignaturaMarticula;
        this.comentario = comentario;
        this.nota = nota;
        this.estado = estado;
        this.nombreNota = nombreNota;
        this.alumno = alumno;
    }

    public String getAlumno() {
        return alumno;
    }

    public void setAlumno(String alumno) {
        this.alumno = alumno;
    }
    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public String getNombreNota() {
        return nombreNota;
    }

    public void setNombreNota(String nombreNota) {
        this.nombreNota = nombreNota;
    }

    public Asignatura getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(Asignatura asignatura) {
        this.asignatura = asignatura;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}
