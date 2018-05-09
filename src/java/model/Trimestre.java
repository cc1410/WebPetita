package model;

import java.util.List;

public class Trimestre {
	private String nombre;
	private List<AsignaturaMatricula> asignaturaMatriculas;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public List<AsignaturaMatricula> getAsignaturaMatriculas() {
		return asignaturaMatriculas;
	}
	public void setAsignaturaMatriculas(List<AsignaturaMatricula> asignaturaMatriculas) {
		this.asignaturaMatriculas = asignaturaMatriculas;
	}
}
