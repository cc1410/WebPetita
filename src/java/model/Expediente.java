package model;

import java.util.List;

public class Expediente {
	private Alumno alumno;
	private List<Trimestre> trimestre;
	private String estado;
	
	public Alumno getAlumno() {
		return alumno;
	}
	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}
	public List<Trimestre> getNotas() {
		return trimestre;
	}
	public void setNotas(List<Trimestre> trimestre) {
		this.trimestre = trimestre;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
}
