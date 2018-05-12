package model;

import java.util.List;

public class Curso {
	private String nombre;
	private List<Asignatura> asignaturas;
	private Integer anyo;

    public Curso(String nombre, List<Asignatura> asignaturas, Integer anyo) {
        this.nombre = nombre;
        this.asignaturas = asignaturas;
        this.anyo = anyo;
    }

    public Curso(String nombre, Integer anyo) {
        this.nombre = nombre;
        this.anyo = anyo;
    }
    
    
        
        
        
        
        
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public List<Asignatura> getAsignaturas() {
		return asignaturas;
	}
	public void setAsignaturas(List<Asignatura> asignaturas) {
		this.asignaturas = asignaturas;
	}
	public Integer getAnyo() {
		return anyo;
	}
	public void setAnyo(Integer anyo) {
		this.anyo = anyo;
	}
	
}
