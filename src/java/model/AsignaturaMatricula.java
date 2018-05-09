package model;

import java.util.List;

public class AsignaturaMatricula {
	private Asignatura asignatura;
	private Profesor profesor;
	private List<Nota> notas;
	private Trimestre trimestre;
	
	public Asignatura getAsignatura() {
		return asignatura;
	}
	public void setAsignatura(Asignatura asignatura) {
		this.asignatura = asignatura;
	}
	public Profesor getProfesor() {
		return profesor;
	}
	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}
	public List<Nota> getNotas() {
		return notas;
	}
	public void setNotas(List<Nota> notas) {
		this.notas = notas;
	}
	public Trimestre getTrimestre() {
		return trimestre;
	}
	public void setTrimestre(Trimestre trimestre) {
		this.trimestre = trimestre;
	}
}
