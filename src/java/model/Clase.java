package model;

import java.util.List;

public class Clase {
	private String nombre;
	private Curso curso;
	private List<Alumno> alumnos;	
	private HorarioSemanal horario;
	private Calendario calendario;
	private Profesor tutor;

    public Clase(String nombre) {
        this.nombre = nombre;
    }

    public Clase() {
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
	public List<Alumno> getAlumnos() {
		return alumnos;
	}
	public void setAlumnos(List<Alumno> alumnos) {
		this.alumnos = alumnos;
	}
	public HorarioSemanal getHorario() {
		return horario;
	}
	public void setHorario(HorarioSemanal horario) {
		this.horario = horario;
	}
	public Calendario getCalendario() {
		return calendario;
	}
	public void setCalendario(Calendario calendario) {
		this.calendario = calendario;
	}
	public Profesor getTutor() {
		return tutor;
	}
	public void setTutor(Profesor tutor) {
		this.tutor = tutor;
	}
	
}
